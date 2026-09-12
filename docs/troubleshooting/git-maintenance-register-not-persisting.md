# git maintenance: "Added: 11 … Total registered: 0"

**Symptom** (KUB-126): `git-maintenance-sync.service` logs `✓ Registering: <repo>` for every repo, journal shows
`fatal: not a git repository` per repo, summary says `Total registered: 0`.
`git config --global --get-all maintenance.repo` is empty.

**Two causes, both in `local/bin/sync-git-maintenance.zsh`:**

1. `git maintenance register [--config-file F] <repo>` — there is **no repo argument**. It registers the *cwd*;
   the extra arg is ignored. The service runs with cwd `$HOME` (not a repo) → every call died with
   `fatal: not a git repository`. Fix: `git -C "$repo" maintenance register …`.
   Unregister for a dir that no longer exists can't use `git -C` → edit the file directly:
   `git config --file F --fixed-value --unset-all maintenance.repo "$repo"`.
2. `git config --global --get-all` does **not** follow `include.path` unless `--includes` is given
   ("defaults to off when a specific file is given"). Registrations live in `~/.gitconfig-maintenance`
   (included from `~/.gitconfig`), so every read counted 0 and each run would re-add everything.

**Why the include file:** `~/.gitconfig` is a dotter *template* (`config/custom/git/gitconfig`) — a real
rendered file, rewritten on every `dotter` deploy. Machine-local state written into it is lost on redeploy;
`~/.gitconfig-maintenance` (not dotter-managed, lives only in $HOME) survives. `--config-file` must point there.
Note KUB-97 removed `~/.config/git/config` — git's global config is `~/.gitconfig` only.

**Also needed:** registering does nothing unless a scheduler runs. `git maintenance start --scheduler=systemd`
(run once from any repo) creates `~/.config/systemd/user/git-maintenance@.service` + `@{hourly,daily,weekly}.timer`
and enables them. These are git-generated, machine-local, not in dotfiles. Check: `systemctl --user list-timers | grep git-maint`.

**Verify:**
```sh
systemctl --user start git-maintenance-sync.service && journalctl --user -u git-maintenance-sync -n 5
git config --global --includes --get-all maintenance.repo | wc -l   # 11 on this box
git -C ~/dev/<repo> config --local maintenance.strategy              # incremental
```
