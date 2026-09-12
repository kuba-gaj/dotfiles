# Zen: some extensions show no icon / popup never opens

## Symptom

In Zen's Extensions (puzzle-piece) panel a subset of extensions has no icon and clicking does nothing
(seen: Dark Reader, Tampermonkey, Obsidian Web Clipper, Karakeep, Window Titler). Others in the same
panel work. Reinstalling one extension fixes that one only.

## Cause

Stale `startupCache` in the profile's cache dir. Everything on disk in the profile itself is fine —
`extensions.json`, `addonStartup.json.lz4`, the `.xpi` files, `extensions.webextensions.uuids`,
`storage/default` all consistent — so don't waste time there. Typical after a Zen upgrade or a profile
copied from another machine (this one came from the mac).

## Fix

Quit Zen fully, then:

```sh
rm -rf "$HOME/.cache/zen/$(awk -F= '/^\[Install/{f=1;next} /^\[/{f=0} f && $1=="Default"{print $2;exit}' ~/.config/zen/profiles.ini)/startupCache"
```

Start Zen. The cache is regenerated; nothing user-owned lives in it. Same recipe applies to Firefox
(`~/.cache/mozilla/firefox/<profile>/startupCache`).

## Notes

- Zen hides the puzzle-piece button by default (`zen.theme.hide-unified-extensions-button = true`);
  extensions parked in `unified-extensions-area` are only reachable through it — that is a separate,
  cosmetic issue, not this bug.
- The profile Zen actually uses is the `[Install…] Default=` entry in `profiles.ini`, not the
  `Profile*` with `Default=1` (stale second profile here).
