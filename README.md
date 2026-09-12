# dotfiles

Personal configuration files for Arch Linux (Hyprland) and macOS (AeroSpace), managed with [dotter](https://github.com/SuperCuber/dotter).

## Key Tools

- **Window Manager:** [Hyprland](https://hyprland.org/) with Hypridle, Hyprlock, Hyprpaper
- **Shell:** ZSH with fzf-tab, modern CLI replacements (eza, bat, ripgrep, fd, zoxide)
- **Editor:** Neovim with lazy.nvim
- **Terminal:** Alacritty
- **Theme:** Catppuccin Mocha

## Structure

```
config/
  shared/     Cross-platform app configs → ~/.config        (every host)
  mac/        macOS-only configs, AeroSpace stack → ~/.config
  custom/     Configs needing special handling (templating, single-dir
              symlinks, or targets outside ~/.config); listed in global.toml
  omarchy/    Omarchy desktop overrides, per-file → listed in global.toml
  .disabled/  Parked configs, not deployed (see config/.disabled/README.md)
etc/        Kept system configs → /etc via omarchy-system (root-owned copies)
local/      User scripts and binaries → ~/.local
docs/       Configuration decisions, hardware notes, and fix documentation
```

`shared/` and `mac/` are each mapped with a single recursive line in
`.dotter/global.toml` (their contents flatten into `~/.config`). **Add a plain
config: just drop the dir into the right one — no `global.toml` edit needed.**
Anything requiring templating, a `recurse = false` directory symlink, or a
target outside `~/.config` goes in `custom/` and is listed explicitly.

## Usage

These dotfiles use [dotter](https://github.com/SuperCuber/dotter) for deployment. Shared mappings live in `.dotter/global.toml`; each machine selects its package and variables via a per-host file (`.dotter/<hostname>.toml`).

```sh
dotter -l .dotter/omarchy.toml deploy     # Linux (Omarchy) → base + omarchy + omarchy-system
dotter -l .dotter/kubas-mac.toml deploy   # macOS → base + macos
```

## License

[MIT](LICENSE)
