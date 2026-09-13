# Mac as headless herdr server

Company code stays on company hardware: `kubas-mac` runs the herdr **server** for
work repos; the Linux box runs the herdr **client** and is the daily driver. Linear
project *Mac herdr server* (KUB-134…146).

## Architecture

```
Linux (client)                              kubas-mac (server)
herdr TUI ── saved machine "kubas-mac" ──ssh mac──▶ remote-client-bridge ──▶ herdr server
  ▲  sidebar: Local + kubas-mac                    (default session, detached daemon)
  │                                                  panes: shells, pi/claude, lazygit…
zsh: hm <herdr args> ─────────────────────ssh mac──▶ herdr <args>   (mac CLI, mac socket)
```

- **Saved machine**: `herdr machine list` → one profile, label `kubas-mac`, target = SSH
  alias `mac`, remote session `default`. Stored in
  `~/.local/state/herdr/client/endpoints.json`. Re-add: `herdr machine add mac --label kubas-mac`
  (interactive terminal — it may ask to install/restart a server).
- **SSH alias `mac`**: dotter template `config/custom/ssh/config`, `mac_host = "kubasmac.local"`
  in gitignored `.dotter/local.toml`. mDNS (`LocalHostName KubasMac`) follows the mac between
  WiFi and dock ethernet; `AddressFamily inet` because avahi returns IPv6 link-local first.
  Key pinned to `kuba.dev.pub` (1P agent holds 6 keys, macOS sshd cuts off at MaxAuthTries).
- **Sockets are per machine.** Local `herdr …` and the `herdr_*` MCP tools only see the Linux
  server. For the mac: `hm pane list`, `hm agent prompt <name> "…"`, `hm pane split w8:p4
  --direction down`. IDs (`w8:p4`, agent names) are scoped to the mac server.

## Server lifecycle (verified KUB-135)

No launchd unit. Herdr handles it:

- The background bridge from the Linux client **starts a stopped server** on the mac within
  ~20 s, non-interactively (tested with `herdr session stop`).
- The server is a **detached daemon** (ppid 1); killing the bridge / dropping SSH leaves it
  running, bridge reconnects in ~5 s.
- Mac TUI (`herdr` in Ghostty) attaches to the running server; detach with `ctrl+b q`. Only
  `herdr server stop` kills the server and its pane processes.
- **Never start a server by hand** (`nohup herdr server`) — herdr flags it as "may not survive
  SSH connection loss" and offers to restart it, killing panes.

**Reboot story**: FileVault pre-boot login → user login (launchd user agents: 1Password,
agentgateway, SoundID) → Linux bridge connects → server starts. Manual login is the accepted
cost; no auto-login on a corp mac.

## Agent topologies

1. **Agent on the mac, local to the code** — default for company code. pi/claude runs in a
   mac pane; drive it from the Linux sidebar or `hm agent prompt …`. Repo, toolchain and
   secrets never leave the mac.
2. **Agent on Linux controlling the mac** — a Linux-side agent uses `hm`/`ssh mac herdr …`
   to create panes, run commands, prompt mac agents. For orchestration, cross-repo work, or
   Linux-only tooling. Only control traffic crosses; code stays on the mac.

## Physical setup

Both machines on one TB4 KVM dock (kb/mouse/screen/ethernet follow the button). Server mode =
mac lid closed, on AC, on WiFi. Requires (owner tickets):

- `sudo pmset -c sleep 0 disablesleep 1` — lid-closed awake on AC (KUB-138).
- Wi-Fi first in `networksetup -ordernetworkservices` so a dock switch doesn't change the mac's
  route/IP (KUB-137).

## Runbook

| symptom | fix |
|---|---|
| sidebar **Attention** | needs an interactive step (host key, auth, incompatible server). Run `herdr --remote mac` in a terminal, answer prompts, restart the Linux client. |
| sidebar dimmed / Reconnecting | normal after sleep/network blip; bounded backoff. Check `ssh mac uptime`, then `hm status server`. |
| `ssh mac` fails, `kubasmac.local` unresolved | `avahi-resolve -4 -n kubasmac.local`; mac asleep or off WiFi. |
| auth fails from Linux | 1P agent locked on Linux — unlock, `ssh-add -l`. Background bridge cannot answer prompts. |
| mac-side git/`op` hangs | 1P desktop prompt on the invisible mac screen. See KUB-140 (service account for `op run`, file key for git). |
| version skew after `brew upgrade herdr` | client/server negotiate; don't stop a running server just because versions differ. Update the server explicitly when you need new server features. |

## Open

- KUB-139 reconnect matrix (owner cases: dock switch, lid, mac TUI, Linux reboot).
- KUB-140 1P headless auth: **blocking** — `git pull` on the mac over ssh fails
  (`communication with agent failed`); file key + service account pending.
- KUB-143 SMAppService "Open at Login" items (Ghostty, Granola, Wispr, macshot, PortalBox,
  Logi, Spotify helper) — System Settings only. KUB-146 before/after measurement.

## Lean boot (M2)

Kept on the mac: 1Password (+ssh-agent), agentgateway, SoundID, Spotify (remote play; audio
interface hangs off the mac), Karabiner, corp (JumpCloud, SentinelOne), git maintenance.
Removed: launchd `com.user.{tmux,colima,borders}`, `homebrew.mxcl.borders`, llm-wiki,
raindrop, vexp, Pearcleaner autoupdate (plists parked in `config/.disabled/launchagents/`);
login items AeroSpace, Raycast, Amphetamine, a-bar, MiddleClick, Menuwhere.
`mac-desktop` (`local/bin`) brings the tiling + utility set back for a laptop day;
`colima start` on demand. Baseline before pruning: 14 G used / 1 G unused, 736 procs (KUB-142).
- Remote access from outside home: parked (Tailscale vs Cloudflare WARP tunnel).
