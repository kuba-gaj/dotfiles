@~/.config/agents/AGENTS.md

## context-mode

### Shell/run/read → context-mode sandbox

`ctx_batch_execute` >1 cmd or >20 lines. `ctx_execute` run code. `ctx_execute_file` big file. `ctx_fetch_and_index` URL (not `WebFetch`). `ctx_search` follow-up + recall. `ctx_index` store later. No `|tail`/`|head`.

### Files

`Read`+`Edit`/`Write`. Read before Edit. No `ctx_execute` for writes.

### Banned Bash

`cat`/`head`/`tail`/`grep`/`find`.

### Quickref

| Want              | Tool                                 |
| ----------------- | ------------------------------------ |
| Run cmd           | `ctx_execute` / `ctx_batch_execute`  |
| Read log/big file | `ctx_execute_file`                   |
| Fetch URL         | `ctx_fetch_and_index` → `ctx_search` |
| Recall prior      | `ctx_search`                         |
| Codebase question | `repowise_search_codebase`/`get_answer` |

## RTK - Rust Token Killer

**Usage**: Token-optimized CLI proxy (60-90% savings on dev operations)

### Meta Commands (always use rtk directly)

```bash
rtk gain              # Show token savings analytics
rtk gain --history    # Show command usage history with savings
rtk discover          # Analyze Claude Code history for missed opportunities
rtk proxy <cmd>       # Execute raw command without filtering (for debugging)
```

### Installation Verification

```bash
rtk --version         # Should show: rtk X.Y.Z
rtk gain              # Should work (not "command not found")
which rtk             # Verify correct binary
```

⚠️ **Name collision**: If `rtk gain` fails, you may have reachingforthejack/rtk (Rust Type Kit) installed instead.

### Hook-Based Usage

All other commands are automatically rewritten by the Claude Code hook.
Example: `git status` → `rtk git status` (transparent, 0 tokens overhead)

@/Users/kuba.gaj/.tessl/RULES.md
