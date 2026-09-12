# KUB-123: rendered by omarchy-theme-set-templates → ~/.local/state/omarchy/current/theme/vicinae.toml,
# copied to ~/.local/share/vicinae/themes/omarchy.toml by hooks/theme-set.d/vicinae. Mapping ported from
# imbypass/omarchy-theme-hook 10-vicinae.sh (upstream broken on Omarchy 4, issue #55).
[meta]
name = "Omarchy"
description = "Follow the Omarchy system theme."
variant = "{{ mode }}"
inherits = "vicinae-{{ mode }}"

[colors.core]
background = "{{ background }}"
foreground = "{{ foreground }}"
secondary_background = "{{ mix background foreground 4% }}"
border = "{{ muted }}"
accent = "{{ accent }}"

[colors.list.item.hover]
background = "{{ mix background foreground 8% }}"
foreground = "{{ foreground }}"

[colors.list.item.selection]
background = "{{ selection_background }}"
foreground = "{{ selection_foreground }}"

[colors.accents]
blue = "{{ blue }}"
green = "{{ green }}"
magenta = "{{ magenta }}"
orange = "{{ orange }}"
purple = "{{ purple }}"
red = "{{ red }}"
yellow = "{{ yellow }}"
cyan = "{{ cyan }}"
