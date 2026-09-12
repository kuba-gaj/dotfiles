# Dotfiles

Personal configuration for two hosts: an Omarchy (Arch + Hyprland) mini-pc and a
work macOS laptop. Deployed by dotter. This glossary fixes the vocabulary used
when deciding what Omarchy owns and what stays mine.

## Language

### Migration verdicts

Every config in the repo gets exactly one verdict against Omarchy.

**Keep**:
My config wins. Dotter deploys it in place of Omarchy's.
_Avoid_: override, mine, custom

**Adopt**:
Omarchy's config wins. My version is retired from the repo (or parked in
`config/.disabled/`).
_Avoid_: drop, delete, default, omarchy's

**Tweak**:
Omarchy's config is the base; my deltas are layered through Omarchy's own
user-override points (e.g. `~/.config/hypr/bindings.lua`).
_Avoid_: patch, extend, customize

### Ownership

**Omarchy-owned**:
A file Omarchy installs and may rewrite on update. Never edited directly; only
tweaked through an override point.
_Avoid_: system file, upstream

**Override point**:
A file or directory Omarchy documents as the place for user changes and
promises not to overwrite (`~/.config/hypr/*.lua`, `~/.config/omarchy/*`).
_Avoid_: hook, config dir, user config

### Repo layout

**Host profile**:
A `.dotter/<hostname>.toml` selecting the dotter packages and variables for one
machine (`omarchy`, `arch`, `kubas-mac`).
_Avoid_: target, machine config

**Museum**:
`config/linux/`: the pre-Omarchy Arch/Hyprland stack, kept intact until each
entry has a verdict.
_Avoid_: legacy, old config

**Omarchy package**:
`config/omarchy/`: artifacts that exist only because of Omarchy (override-point
files, Omarchy-specific dotter entries). Grows as the museum empties.
_Avoid_: linux config, overrides dir

### Desktop

**Scratchpad**:
A named Hyprland special workspace holding one app, toggled by a key; launches the
app if it is not running. Defined in the omarchy package, not by a daemon.
_Avoid_: dropdown, hyprscratch, special
