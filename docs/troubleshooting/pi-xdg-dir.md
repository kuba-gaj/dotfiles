# `~/.pi` keeps reappearing (pi config lives in `~/.config/pi`)

## Symptom

`~/.pi/` exists again (or config from `~/.config/pi/agent` is silently ignored) even though `.zshenv` exports `PI_CODING_AGENT_DIR=$XDG_CONFIG_HOME/pi/agent`.

## Cause

pi core honors `PI_CODING_AGENT_DIR` (`docs/environment-variables.md`), but many
extensions hardcode `homedir() + ".pi"`. Some **write** there (creating the dir),
others only **read** there (losing our config). Audit as of 2026-09-12 (KUB-80/KUB-95):

| Package | Path | R/W | Status |
|---|---|---|---|
| pi-extensible-workflows | `~/.pi/workflows` | W | fixed in fork, branch `xdg-pi-dir` |
| context-mode | `~/.pi/context-mode` | W | upstream issue drafted |
| pi-readseek | `~/.pi/readseek` | W | upstream issue drafted |
| @plannotator/pi-extension | `~/.pi/plannotator-review-status.json` | W | upstream issue drafted |
| @raquezha/noheadroom | `~/.pi/agent/headroom/settings.json` | R+W | upstream issue drafted |
| pi-skills-manager | `~/.pi/agent/skills` | R+W | upstream issue drafted |
| pine-of-glass | `~/.pi/agent/pi-{cachemire,contextimate,meantime,traceline}.json` | R | upstream issue drafted |
| @firstpick/pi-utils | `~/.pi/webui/settings.json` | R | env override `PI_WEBUI_SETTINGS_FILE` |
| pi-fancy-footer | `~/.pi/agent/auth.json` | R | cosmetic, upstream issue drafted |

Already env-aware (no action): pi-caveman, pi-web-access (via `XDG_CONFIG_HOME`),
@plannotator `config.ts`, pi-cymbal/pi-mcp-adapter (use pi's `CONFIG_DIR_NAME`),
pi-tool-display, pi-rtk-optimizer, pi-observational-memory, pi-advisor-flow, pi-claude-auth.

## Fix (current)

Stopgap: `.dotter/post_deploy.sh` keeps `~/.pi → ~/.config/pi` as a symlink, so
every hardcoded path resolves to the dotter-managed tree. **Do not remove it** until
every R+W row above is fixed upstream and the installed version bumped — otherwise
noheadroom/skills-manager fork their state and pine-of-glass loses config.

If `~/.pi` is a *real directory* (symlink got clobbered), merge and relink:

```sh
rsync -a ~/.pi/ ~/.config/pi/ && rm -rf ~/.pi && ln -s ~/.config/pi ~/.pi
```

## Re-audit

```sh
cd ~/.config/pi/agent/npm/node_modules
grep -rn 'homedir()[^;]*"\.pi"\|homedir()[^;]*\.pi/\|homePath("\.pi' --include=*.ts --include=*.mjs --include=*.js . \
  | grep -v '/dist/\|/test/\|\.test\.\|/node_modules/.*/node_modules/' | grep -v PI_CODING_AGENT_DIR
```

Anything listed is a candidate blocker for dropping the symlink. Issue drafts:
`docs/.scratch/pi-xdg-upstream-issues.md`, `docs/.scratch/context-mode-issue-xdg.md`.
