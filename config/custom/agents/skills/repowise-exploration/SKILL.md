---
name: repowise-exploration
description: >
  Use when exploring, understanding, or answering questions about a codebase that has Repowise
  indexed (a .repowise/ directory in the project root, or a .repowise-workspace.yaml marking a
  multi-repo workspace root — there, pass repo="<alias>" or repo="all"). Activates for "how does X work",
  "explain the architecture", "where is Y implemented", "what does this module do", or any task
  that needs an understanding of structure before diving into source files.
---

# Codebase Exploration with Repowise

This project has a Repowise intelligence layer. Before grepping and reading raw
source to understand the codebase, reach for the Repowise tools — they return
documentation, ownership, history, decisions, and graph structure that plain
file reads don't, usually in one round-trip instead of many.

Native pi tools: `repowise_get_answer`, `repowise_get_context`, `repowise_get_symbol`,
`repowise_get_why`, `repowise_get_risk`, `repowise_search_codebase`. The rest of the
server's tools (`get_overview`, `get_health`, `get_dead_code`, ...) go through the
proxy: `mcp({ server: "repowise", tool: "get_overview", args: {...} })`.

## Which tool for which question

| You want… | Call |
|---|---|
| First orientation in an unfamiliar repo | `get_overview` (via proxy) — architecture summary, key modules, entry points, git health, knowledge map. Skip it once you have the map. |
| A direct answer to "how/where/why does X work" | `repowise_get_answer(question="…")` — synthesised answer with citations + a `retrieval_quality` signal. Collapses the search → read → reason loop. |
| Find a symbol, file, or fuzzy concept | `repowise_search_codebase(query="…")` — hybrid search. `mode="auto"` routes an identifier to indexed symbol hits (`symbol_id`/line bounds → pipe into `get_symbol`), a path to file pages (→ `get_context`), and prose to semantic wiki search. Force a branch with `mode=symbol\|path\|concept\|hybrid`. |
| A triage card for specific files/symbols | `repowise_get_context(targets=[…])` — title, summary, signatures, hotspot bit, top callers, decision titles, symbol_ids. Batch many targets in one call. |
| The actual source of one symbol | `repowise_get_symbol("path/to/file.py::Name")` — exact bytes with line bounds. Use a `symbol_id` from `get_context`. |
| Why code is shaped this way | `repowise_get_why(query or targets)` — decision records + git archaeology. |

## Recommended flow

1. New area you don't know → `get_overview` once.
2. A specific question → `repowise_get_answer(question=…)` first.
   - High confidence → answer it, cite the paths.
   - `medium`/`low` confidence → follow `best_guesses[0].file` or
     `fallback_targets[0]` into `get_context`, then `get_symbol` for bytes.
3. A named symbol or a path → `repowise_search_codebase(query="Name")`; symbol
   hits pipe straight into `get_symbol`, file hits into `get_context`.
4. More files around a concept → `search_codebase`, then `get_context` on the
   hits (batched), then `get_symbol` only for the bodies you actually need.

Fall back to `grep`/`find`/`read` when the indexed context doesn't cover the
specific detail asked about, the index is stale, or you're outside the indexed
workspace. `bash` is for running processes, not navigation.

## Trust signals — verify when

- `_meta.stale_warning` is present (the index has diverged from HEAD), or
- `retrieval_quality` is `partial`/`weak`, or
- a result's `search_method` is `bm25`.

Otherwise the response reflects the last indexed commit — uncommitted working-tree
changes are invisible to it (index syncs on post-commit).

## Error handling

- "No repositories found. Run 'repowise init' first." → suggest `repowise init`
  (CLI). Add `--no-editor-setup` for scratch clones, fixtures, or worktrees.
- `get_answer`/`search_codebase` come back empty → the repo may have a
  template-rendered wiki. Fall back to `get_context` with explicit paths.
- Tools fail to connect → the `repowise` binary may not be installed; fall back
  to `grep`/`read` and say risk/context intelligence was unavailable.
