# ALT is the window-management modifier, layered over Omarchy's SUPER binds

Omarchy binds everything to SUPER; the owner's hands have a decade of ALT for window management
(`ALT+HJKL`, `ALT+1..0`, `ALT+SHIFT+n`) and SUPER for apps. We add the ALT layer through
`bindings.lua` **without** removing Omarchy's SUPER tiling binds — every ALT bind is collision-free, so
both work and Omarchy's docs/`SUPER+K` cheat sheet stay true. Only the SUPER keys reused for per-app
scratchpads (and `ALT+TAB`) are `hl.unbind`-ed first. Rejected: `omarchy_default_bindings = false`
(throws away ~150 good defaults to avoid theoretical future collisions).

Consequences: every `o.bind` must carry a description (the keybinding menu is generated from
`~/.config/hypr/hyprland.lua`); a new Omarchy release binding a SUPER key we use for a scratchpad
will double-fire until unbound — check `omarchy menu keybindings --print` after updates.
