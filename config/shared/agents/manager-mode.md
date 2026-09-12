# Manager mode & tracker conventions

## Manager mode

> [!IMPORTANT]
> **Main session only.** Manager mode is activated exclusively by the human
> owner, directly in conversation. If you were launched with a role and a brief
> (subagent, workflow agent, herdr child) you are NEVER the manager — no ticket
> claiming, no tracker writes beyond your brief, no handoffs. Execute your brief
> and report to your parent. The Linear conventions below still apply to you.

Activated when the owner names a project to run ("you own X", a /punk-resume
handoff, or a wayfinder map). The agent is the **manager**: owns delivery
end-to-end, plans, delegates to subagents, works tickets. The human is the
**owner**: consulted for decisions, clarifications, and acceptance — never for
work the manager can do himself.

- **Memory model**: the tracker project (Linear) is durable shared truth —
  decisions, resolutions, work log. The punk-handoff doc is the session baton —
  in-flight state only (current ticket, uncommitted changes, gotchas, next
  action). Handoff wins for "where was I", tracker wins for "what was decided".
- **Session start**: resume the handoff (/punk-resume), then read the tracker
  frontier. If manager mode is expected and **no handoff exists, say exactly
  that, first thing** — the owner assigns a project or briefs. Never
  reconstruct project state by guessing.
- **Session end** (or context running low): mandatory, both steps — log
  completed work to the tracker (comments/status), then write a handoff
  (/punk-handoff). Even mid-ticket.
- **Acceptance**: manager closes tickets after self-check (reviewer subagent
  for code changes); owner spot-checks via the tracker and reopens if unhappy.
  <!-- future: decision/architecture tickets may require explicit owner
  acceptance before close -->
- **Ticket discipline** follows the tracker's method (wayfinder maps: one
  decision ticket per session, claim = assign, resolution comment + close).

## Linear conventions

- Access: Linear MCP tools only (`*linear_*` via the `mcp`/`mcpScript` tools —
  gateway route on the mac, direct `linear` server on omarchy). No CLI fallback:
  if the tools fail, fail early and fix the MCP route instead of improvising —
  applies to anyone updating issues (manager, comms, workflows).
  Operations reference: `docs/agents/issue-tracker.md`.
- Branch names and PR titles carry the ticket reference (e.g. `KUB-123`);
  at work this auto-transitions status (in-pr/uat/prod). Same habit privately.
- Private team: `Kuba` (KUB). Wayfinder artifacts: map labelled
  `wayfinder:map`, tickets labelled `wayfinder:<type>`, child issues of the map.
- **States**: `Backlog` = uncommitted (someday / parked so it isn't lost).
  `Todo` = committed work on the frontier. The manager promotes Backlog → Todo
  when placing a ticket on the frontier; milestone progress is judged on
  Todo-and-up, never on Backlog. `In Progress` = claimed (assigned).
- **Owner-needed tickets** (decisions, sudo, logins, spot-checks) are real
  tickets: `Todo`, assigned to the owner, label `ready-for-human`. The manager
  never sits on them silently — file, label, move on.
- **PRs are part of the ticket lifecycle**, not separate tickets. The agent
  authors, pushes, and merges PRs on repos we own (own forks included) once
  checks pass; the ticket closes on merge. Upstream/public PRs: open, link, and
  the ticket waits (`ready-for-human` if the owner must act).
- **External blockers** (upstream fixes, third parties): don't keep a ticket
  open to wait on them. Cancel with a comment, or park in `Backlog` with no
  milestone if it is genuinely worth revisiting.
