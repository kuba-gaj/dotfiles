# `/etc/docker/daemon.json` is dotter-owned despite belonging to `omarchy-settings`

Docker has a single config file and no drop-in directory, and `omarchy-settings` ships one
(log rotation, `dns`/`bip` 172.17). We need `default-address-pools 172.240.0.0/16` and
`containerd-snapshotter`, neither expressible on the `dockerd` command line. So the file is the one
deliberate exception to "never own an omarchy-owned file": dotter deploys a **merged** copy
(omarchy's keys + ours). Rejected: a `systemctl edit docker` drop-in (loses the snapshotter);
skipping the needs (this is a dev workstation, docker will be used).

Consequences: an `omarchy-settings` upgrade that changes the file produces `daemon.json.pacnew`
(pacman never overwrites a modified config) — merge it into `etc/docker/daemon.json` in the repo and
redeploy. Check `pacdiff` after `omarchy-update`.
