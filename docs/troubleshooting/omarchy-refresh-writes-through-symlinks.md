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

## Second failure mode: shell commands replace the symlink

`omarchy bar …`, `omarchy plugin enable|disable`, `omarchy refresh shell` (`omarchy-bar defaults`) and
`omarchy display text size` write via `jq … > $(mktemp); mv tmp ~/.config/omarchy/shell.{json,toml}`.
`mv` replaces the dotter symlink with a real file — the repo copy is untouched, `git status` is clean,
but the live file has drifted and `dotter -v -d` reports the target as an existing-file collision.
(`omarchy refresh shell` does both: `cp -f` through the link first, then `mv` over it.)

Recovery — keep omarchy's write, diff it into the repo:

```sh
mv ~/.config/omarchy/shell.json{,.omarchy-new} && cd ~/dotfiles && dotter
diff ~/.config/omarchy/shell.json.omarchy-new config/omarchy/omarchy/shell.json   # port what you want, commit
```

Prefer editing `config/omarchy/omarchy/shell.{json,toml}` directly over the CLI; the shell live-reloads both.
(`omarchy display text size` additionally `sed -i`s `~/.config/ghostty/config` and sets GTK `text-scaling-factor`;
use `[font] base-size` in `shell.toml` instead — KUB-111.)

## Rule

**Never run `omarchy-reinstall-configs` on this box.** Run a single
`omarchy-refresh-config <path>` only for a file omarchy owns (not a dotter symlink), and
`git status` afterwards.
