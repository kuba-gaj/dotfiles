import { spawn } from "node:child_process";
import { existsSync } from "node:fs";
import { dirname, join } from "node:path";
import { randomUUID } from "node:crypto";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

/**
 * Pi port of the repowise Claude Code hook layer (prototype).
 *
 * All analysis lives in the `repowise-augment` binary (crash-proof, budgeted);
 * this extension is stdin/stdout plumbing speaking the Claude hook envelope
 * (`hook_event_name` / `hookSpecificOutput.additionalContext`), since no
 * `--client pi` contract exists upstream yet.
 *
 *  - session start  -> SessionStart payload, inject context message
 *  - tool_result    -> PostToolUse / PostToolUseFailure, append notice to result
 *
 * Deliberately NOT ported: the PreToolUse rewrite hook (pi-rtk-optimizer owns
 * command rewriting here) and `updatedToolOutput` replacement (additionalContext
 * only — replacement shapes are Claude-typed).
 */

// pi tool name -> Claude tool name the augment handlers dispatch on.
const TOOL_MAP: Record<string, string> = {
	grep: "Grep",
	find: "Glob",
	read: "Read",
	edit: "Edit",
	write: "Write",
	bash: "Bash",
};

// Matches upstream hooks.json timeout: 10. Common PostToolUse path measured ~0.5s;
// the zero-match semantic rescue (embedding lookup) legitimately takes ~10s.
const SESSION_START_TIMEOUT_MS = 10_000;
const POST_TOOL_TIMEOUT_MS = 10_000;
const MAX_OUTPUT_CHARS = 20_000; // cap tool output forwarded to augment

const SESSION_ID = randomUUID(); // ledger correlation only

import { appendFileSync } from "node:fs";
const DEBUG_LOG = process.env.REPOWISE_AUGMENT_DEBUG; // path to a log file enables debug
function dbg(msg: string) {
	if (!DEBUG_LOG) return;
	try {
		appendFileSync(DEBUG_LOG, `${new Date().toISOString()} ${msg}\n`);
	} catch {}
}

function repoWithIndex(cwd: string): string | null {
	let dir = cwd;
	for (;;) {
		if (existsSync(join(dir, ".repowise"))) return dir;
		const parent = dirname(dir);
		if (parent === dir) return null;
		dir = parent;
	}
}

/** Claude tool_input shapes use file_path; pi uses path. */
function mapInput(piTool: string, input: Record<string, unknown>): Record<string, unknown> {
	if (piTool === "read" || piTool === "edit" || piTool === "write") {
		return { ...input, file_path: input.path ?? input.file_path };
	}
	return input;
}

function textOf(content: unknown): string {
	if (!Array.isArray(content)) return "";
	return content
		.filter((b): b is { type: string; text: string } => !!b && (b as any).type === "text")
		.map((b) => b.text)
		.join("\n")
		.slice(0, MAX_OUTPUT_CHARS);
}

/** Run repowise-augment with a JSON payload; return additionalContext or null. Never throws. */
function augment(payload: object, timeoutMs: number): Promise<string | null> {
	return new Promise((resolve) => {
		try {
			const child = spawn("repowise-augment", [], { stdio: ["pipe", "pipe", "ignore"] });
			let out = "";
			const timer = setTimeout(() => child.kill("SIGKILL"), timeoutMs);
			child.stdout.on("data", (d) => (out += d));
			child.on("error", () => {
				clearTimeout(timer);
				resolve(null);
			});
			child.on("close", () => {
				clearTimeout(timer);
				try {
					const ctx = JSON.parse(out)?.hookSpecificOutput?.additionalContext;
					resolve(typeof ctx === "string" && ctx.trim() ? ctx : null);
				} catch {
					resolve(null);
				}
			});
			child.stdin.end(JSON.stringify(payload));
		} catch {
			resolve(null);
		}
	});
}

export default function (pi: ExtensionAPI) {
	let sessionStartDone = false;

	pi.on("before_agent_start", async (_event, ctx) => {
		if (sessionStartDone) return;
		sessionStartDone = true;
		const root = repoWithIndex(ctx.cwd);
		if (!root) return;
		const context = await augment(
			{ hook_event_name: "SessionStart", source: "startup", cwd: root, session_id: SESSION_ID },
			SESSION_START_TIMEOUT_MS,
		);
		if (!context) return;
		return {
			message: { customType: "repowise-augment", content: context, display: true },
		};
	});

	pi.on("tool_result", async (event, ctx) => {
		dbg(`tool_result tool=${event.toolName} cwd=${ctx?.cwd}`);
		const claudeTool = TOOL_MAP[event.toolName];
		if (!claudeTool) return;
		const root = repoWithIndex(ctx.cwd);
		if (!root) return;

		const base = {
			tool_name: claudeTool,
			tool_input: mapInput(event.toolName, (event.input ?? {}) as Record<string, unknown>),
			cwd: root,
			session_id: SESSION_ID,
		};
		const payload = event.isError
			? { hook_event_name: "PostToolUseFailure", ...base, error: textOf(event.content), is_interrupt: false }
			: { hook_event_name: "PostToolUse", ...base, tool_response: { output: textOf(event.content) } };

		const t0 = Date.now();
		const context = await augment(payload, POST_TOOL_TIMEOUT_MS);
		dbg(`augment done tool=${event.toolName} ms=${Date.now() - t0} ctx=${context ? context.slice(0, 60) : null}`);
		if (!context) return;
		return {
			content: [...(event.content ?? []), { type: "text", text: `\n${context}` }],
		};
	});
}
