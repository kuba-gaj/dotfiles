# Zen browser: migrating a profile from macOS to Linux (KUB-84)

Copying `~/Library/Application Support/zen/Profiles/<id>/` to the Linux profile dir works with Zen at the same version on both sides. Gotchas:

## Profile location

`zen-browser-bin` (AUR) uses **`~/.config/zen/<hash>.Default (release)/`**, not `~/.zen`. Check `profiles.ini` there. Launch Zen once to scaffold, then quit.

## rsync path escaping

`ssh mac` to an older macOS rsync chokes on the space + parens in the path (`-s` unsupported, escaped paths not unescaped remotely). Symlink on the mac instead:

```sh
ssh mac 'ln -sfn "$HOME/Library/Application Support/zen/Profiles/<id>.Default (release)" /tmp/zenprof'
rsync -aL --delete --exclude '*.lock' --exclude lock --exclude compatibility.ini --exclude parent.lock \
  mac:/tmp/zenprof/ ~/.config/zen/<hash>.Default\ \(release\)/
```

Zen must be closed on both machines. Copy only the profile dir, not `Profile Groups/` or `installs.ini`/`profiles.ini` (they embed mac paths / install hashes; local ones are fine).

## Files embedding mac paths

- `extensions.json` — `rootURI` per add-on points at `/Users/…`. **Don't delete it**: with it gone, Firefox re-registers every `.xpi` as sideloaded and leaves them *disabled*; you re-enable one by one in `about:addons`. It self-heals on first launch (paths are rewritten). Same for `addonStartup.json.lz4`.
- `pkcs11.txt` — `configdir='sql:/Users/…'`; rewritten on startup, ignore.

## What survived

Themes/mods, sidebar side, `about:config` (`prefs.js`), logins/cookies, history, Tridactyl (native host from `firefox-tridactyl-native-bin`, config from `config/linux/tridactyl`). Extensions survive if `extensions.json` is left alone.
