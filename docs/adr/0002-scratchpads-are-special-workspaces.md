# Per-app scratchpads are plain special workspaces, no daemon

The museum ran 17 `hyprscratch` scratchpads via a systemd daemon. hyprscratch is retired (KUB-82) and
Omarchy offers only one anonymous `special:scratchpad`. Each owner scratchpad is now a named
`special:<app>` workspace: an `o.window` rule (`workspace special:<app> silent`, float, 1920x1200,
center) plus a bind to a six-line `scratch` wrapper that toggles the special if the app is running,
else launches it via `uwsm-app`. No pinning to an output (the mini-pc travels). Window rules append
and cannot be removed at runtime, so the list is kept to apps actually installed.

The unified SUPER layout changes only these app triggers, not their scratchpad behavior:

| App | Trigger | Previous trigger |
|---|---|---|
| Linear | SUPER+T (tickets) | SUPER+L |
| 1Password | SUPER+P (passwords) | SUPER+1 (`code:10`) |
| Proton Mail | SUPER+E (email) | SUPER+P |

SUPER+L now focuses right; SUPER+1 selects workspace 1. See [ADR 0001](0001-alt-window-management-layer.md)
for the physical left Alt/SUPER swap.
