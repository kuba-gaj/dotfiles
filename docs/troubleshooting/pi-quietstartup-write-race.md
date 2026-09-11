# Startup warning: "prune-resource-list: contextimate never anchored"

## Symptom

Intermittently on pi startup:

```
prune-resource-list: contextimate never anchored; check quietStartup is false and pine-of-glass is loaded
```

Full resource listing stays on screen, no `[Contextimate]` block. Yet whenever you
inspect `settings.json`, `quietStartup` is `false`.

## Cause

Write race on `settings.json` (symlinked to this repo):

1. `pi-cc-header`'s `session_start` handler (`configStartupEnabled`) synchronously
   writes `quietStartup: true` + `clearOnStart: true` to `settings.json` in every
   pi process, gated only by `ccHeader.readOnlyConfig !== true`.
2. `prune-resource-list.ts` writes `false` back — but on deferred timers
   (`setTimeout(0)` and a 10s second pass).
3. Any interactive boot that reads disk while `true` is winning (session killed
   between the two writes, or another concurrent pi process wrote `true` just
   before boot) starts quiet → pi renders no resource rows → contextimate has no
   anchor → warning at 10s.

Post-hoc inspection always shows `false` because the write-back landed by then.

## Fix

`"readOnlyConfig": true` inside `ccHeader` in `config/custom/pi/agent/settings.json`.
`configWritesEnabled()` then returns `false` and cc-header never writes
`settings.json` at all. Bonus: stops cc-header churning a dotter-managed file.

`unquietStartup` in `prune-resource-list.ts` is kept as a dormant safety net.

## Caveats

- Sessions started before the fix loaded config without `readOnlyConfig`; a
  cc-header UI action (`/htg` etc.) there could write `true` one last time.
- cc-header config changes are now session-only; persist by editing
  `settings.json` by hand.
- Regression signal: `git status` in dotfiles staying clean across sessions
  (cc-header no longer rewrites the file). If the warning still fires with the
  listing eventually disappearing and `[Contextimate]` appearing, that is the
  *other* cause — slow anchor past the 10s deadline, a false positive.

## Related

`pi-cc-header-clobbered-by-contextimate.md` — different fight between the same
two extensions (header reset vs. load order).
