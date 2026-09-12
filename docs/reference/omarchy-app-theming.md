# Omarchy theming for apps omarchy doesn't cover (Zen, Vicinae, Spotify)

Pattern (KUB-118, KUB-123): omarchy's own template engine + a `theme-set.d` hook per app. No third-party dep.

## How it works

`omarchy theme set X` → `omarchy-theme-set-templates` renders every `~/.config/omarchy/themed/*.tpl`
(`{{ background }}`, `{{ accent_strip }}`, `{{ mix bg fg 8% }}`, … — full key list: `omarchy-theme-color --file
~/.local/state/omarchy/current/theme/colors.toml --all`) into `~/.local/state/omarchy/current/theme/<name>` →
`omarchy-hook theme-set X` runs every file in `~/.config/omarchy/hooks/theme-set.d/` (files only, `.sample` skipped,
stdout discarded → use `omarchy-notification-send`).

Both dirs are dotter-managed via `config/omarchy/omarchy → ~/.config/omarchy`:

| app | template(s) | hook | takes effect |
|---|---|---|---|
| Zen | `themed/zen.css.tpl`, `zen-user.js.tpl` | `hooks/theme-set.d/zen` (symlinks into profile) | Zen restart |
| Vicinae | `themed/vicinae.toml.tpl` | `hooks/theme-set.d/vicinae` (cp → `~/.local/share/vicinae/themes/omarchy.toml`, `vicinae theme set omarchy`) | live |
| Spotify | `themed/spicetify-color.ini.tpl`, `spicetify-user.css.tpl` | `hooks/theme-set.d/spotify` (cp → `~/.config/spicetify/Themes/omarchy/`, `spicetify -q -n apply`) | Spotify restart |

Hooks exit 0 silently when the app or rendered file is missing (themes without `colors.toml` render nothing).

## Spotify / Spicetify

`spicetify-cli` (AUR) patches the Spotify install. Ours is `spotify-launcher` → user-writable
`~/.local/share/spotify-launcher/install/usr/share/spotify`, prefs `~/.config/spotify/prefs` (set once via
`spicetify config spotify_path … prefs_path …`; lives in `~/.config/spicetify/config-xpui.ini`, not dotter-managed).

**Every Spotify update undoes the patch** (accepted). Re-apply:

```
spicetify restore backup apply
```

If the hook's `apply` fails it sends a critical notification with that command. New machine: install spicetify-cli,
set the two paths, `spicetify backup apply`, then any `omarchy theme set`.

## Why not imbypass/omarchy-theme-hook

Broken on Omarchy 4 (upstream issue #55, unfixed on `main` since 2026-05): reads colors from the pre-4 path
(`~/.config/omarchy/current/theme`) so every colour is empty, and `omarchy-hook` runs its hooklettes twice
(second run without helpers → `command not found` flood). A fix exists only in a fork (Redzselek PR #1). Its
Vicinae/Spotify colour mappings were ported into the templates above.
