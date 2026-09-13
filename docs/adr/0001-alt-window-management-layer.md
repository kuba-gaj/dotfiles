# SUPER is the desktop modifier, on the comfortable physical Alt key

Updated 2026-09-13: this supersedes the original SUPER-for-apps / ALT-for-window-management
split. The physical left Alt key next to Space is more comfortable, but global ALT bindings
intercept application shortcuts. `input.lua` uses XKB `altwin:swap_lalt_lwin`: physical left Alt
sends SUPER and physical left SUPER sends ALT. This covers all keyboards in Hyprland only;
TTYs and right-side modifiers (including right-SUPER dictation) stay unchanged. Preserve the
existing compose/caps options when setting the full `kb_options` string. No keyd or firmware swap.

`bindings.lua` uses SUPER for primary window management and apps, SUPER+CTRL for system
controls, and SUPER+ALT for secondary window management. SHIFT adds a related variant.
Workspace digits/brackets switch normally, move silently with SHIFT, and move-and-follow with
ALT. The terminal family deliberately overrides the category rule: SUPER+Enter toggles dropterm,
SHIFT adds a new plain terminal, and CTRL opens a Herdr terminal.

Omarchy defaults remain loaded; only conflicting or explicitly retired shortcuts are removed.
Do not retain the old personal ALT window-management aliases or globally rewrite mixed modifiers.
Unused stock families can remain; rare commands are accessible through the launcher/menu.
Rejected: `omarchy_default_bindings = false` (discards useful defaults unnecessarily).

Consolidate `hl.unbind` calls **before** replacement registrations, including numeric keycode
forms that overlap keysym bindings. A late unbind can erase a newly assigned shortcut.
Every `o.bind` needs a description; inspect `omarchy menu keybindings --print` after updates.
`hyprctl -j binds` alone cannot identify Lua keycode bindings reliably. Desktop help is now
SUPER+CTRL+K; its SHIFT variant opens Herdr help.

The keybinding-guide Lua integration in `hyprland.lua` remains commented out following a native
crash during rebinding. The original Omarchy import and built-in keybinding help remain enabled.
