# Parked systemd user units (KUB-92 / KUB-122)

Not deployed by dotter. Kept because they may return:

- `tmux*.{service,socket,timer}`, `tmux-term@.service`, `multiplexer.target` — tmux session persistence stack.
  Never activated (socket fought tmux's own); tmux barely used since herdr. Config parked in `../tmux/`.
- `hyprevents.service` — bash Hyprland IPC reactor (`local/bin/hyprevents`, still deployed): zen `ws<N>` tab-title
  → workspace routing (being ported to `hl.on("window.title")` in `config/omarchy/hypr/hyprland.lua`, KUB-122 item 7) and
  1Password focus-return (no `window.focus` event in omarchy's `hl` API → not portable; revisit).
