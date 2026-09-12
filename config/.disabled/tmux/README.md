# tmux — parked (KUB-86)

herdr replaces tmux as the terminal multiplexer on omarchy. `tmux.conf` (dotter template) and the macOS
LaunchAgent `com.user.tmux.plist` are kept here for reference; neither is deployed. Docs stay in
`docs/reference/tmux/` (systemd integration, race-condition fix).

## What this setup had that herdr lacks (as of herdr 0.8.2)

- **Session save/restore**: tmux-resurrect + tmux-continuum (macOS only; 15-min autosave, restore on start,
  `@resurrect-processes 'nvim'`). On Arch, systemd units started the server instead (see docs/reference/tmux).
- **Auto-start on login**: LaunchAgent (macOS) / systemd user unit (Arch).
- **TPM plugins used**:
  - `catppuccin/tmux#v2.3.0` — theme (mocha, slanted window tabs, transparent status bg)
  - `soyuka/tmux-current-pane-hostname` — hostname in status
  - `aserowy/tmux.nvim` — seamless C-h/j/k/l pane↔nvim-split navigation, C-arrows resize
  - `omerxx/tmux-sessionx` — fzf session switcher (`prefix o`)
  - `omerxx/tmux-floax` — floating scratch pane (`prefix p` / `P` menu, 80%×80%)
  - `wfxr/tmux-fzf-url` — fzf-pick URLs from scrollback (`prefix x`)
  - `fcsonline/tmux-thumbs` — hint-based copy of text/paths
  - `tmux-plugins/tmux-resurrect`, `tmux-plugins/tmux-continuum` (macOS only)
  - (`kuba-gaj/tmux-yank` — commented out)
- **vim-tpipeline bridge**: status-left/right read nvim's statusline via `#{socket_path}-#{session_id}-vimbridge`.

herdr equivalents already installed as herdr plugins (see `config/shared/herdr*`): navigator (tmux.nvim),
floax, lazygit, mirror, worktrunk. Not covered: save/restore, sessionx-style fzf switcher, fzf-url, thumbs,
vim-tpipeline.

The herdr 0.8.2 tmux-mirror config drafted during migration: `docs/.scratch/herdr-config-omarchy-0.8.2-tmux-mirror.toml`
(gitignored; may be gone).
