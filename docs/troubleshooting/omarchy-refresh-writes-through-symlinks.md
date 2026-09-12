# Omarchy refresh scripts write through dotter symlinks

## Symptom

After `omarchy-update`, `omarchy-refresh-*`, or `omarchy-reinstall-configs`, `git status`
in `~/dotfiles` shows modified (or emptied) files under `config/shared/` you never touched.

## Cause

`omarchy-refresh-config <path>` does `cp -f $OMARCHY_PATH/config/<path> ~/.config/<path>`;
`omarchy-reinstall-configs` does `cp -af /etc/skel/. ~/`. Neither passes
`--remove-destination`, so when the destination is a dotter symlink `cp` opens the link
target for writing — the omarchy default lands **in the repo file**, not on top of the link.

Worst case: omarchy's `lazygit/config.yml` is a 0-byte placeholder, so a reinstall
truncates `config/shared/lazygit/config.yml` to empty.

Callers: `omarchy-refresh-{herdr,tmux,shell}`, two migrations (`herdr/config.toml`
guarded by `[[ -f ]] ||`, `kitty/kitty.conf`), and `omarchy-reinstall-configs` (everything
in `/etc/skel`). Package upgrades alone never touch `$HOME`.

## Recovery

```sh
cd ~/dotfiles && git checkout -- config/shared && dotter
```

Check `git status` once more; any `.bak.<epoch>` files left in `~/.config` are omarchy's
backups of the (already-correct) repo content and can be deleted.

## Rule

**Never run `omarchy-reinstall-configs` on this box.** Run a single
`omarchy-refresh-config <path>` only for a file omarchy owns (not a dotter symlink), and
`git status` afterwards.
