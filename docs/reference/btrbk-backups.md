# btrbk backups (omarchy → kbs.lan)

Config: `etc/btrbk/btrbk.conf` → `/etc/btrbk/btrbk.conf` (dotter `[omarchy-system]`, root-owned template copy). KUB-129/KUB-130.

## Topology

- Source: top-level of `/dev/mapper/root` mounted at `/mnt/btr_pool` (`mnt-btr_pool.mount`), subvolumes `@` and `@home`.
- Snapshots: `btrbk.timer` hourly → `/mnt/btr_pool/btrbk_snapshots/@.<ts>`, `@home.<ts>` (`snapshot_create onchange`).
  Retention `snapshot_preserve_min latest`, `snapshot_preserve 7d`.
- Target: incremental `btrfs send` over ssh to `ssh://kbs.lan/mnt/btrfs/omarchy` (`ssh_user root`,
  `ssh_identity /etc/btrbk/ssh/id_ed25519`). Retention `target_preserve_min latest`, `target_preserve 7d 4w`.
- `btrbk.service`: `RequiresMountsFor=/mnt/btr_pool`, `OnFailure=notify-failure@%n` → `gotify push` (root's `gotify init`).

## kbs.lan side

Debian (Proxmox Backup Server), ssh as **root**, no sudo → `backend_remote btrfs-progs` (with `btrfs-progs-sudo` btrbk
prefixes `sudo -n` → `eval: sudo: not found`). Destination: btrfs at `/mnt/btrfs` (1.64 TiB), subvolume `/mnt/btrfs/omarchy`.
Key is restricted in `/root/.ssh/authorized_keys` (one line, options first):

```
command="/usr/share/btrbk/scripts/ssh_filter_btrbk.sh -l -t -d -p /mnt/btrfs/omarchy",restrict ssh-ed25519 AAAA… btrbk@omarchy
```

`-t` target only (receive/show/list; never `-s`), `-d` allows delete for pruning, `-p` pins paths, `-l` logs to syslog
(`journalctl -t ssh_filter_btrbk.sh` on kbs). `sudo ssh -i /etc/btrbk/ssh/id_ed25519 root@kbs.lan ls` must be **rejected**.

## Check

```
sudo btrbk -c /etc/btrbk/btrbk.conf list backups
sudo btrbk -c /etc/btrbk/btrbk.conf -v dryrun        # ">>>" lines = pending incremental sends
systemctl list-timers btrbk.timer
journalctl -u btrbk.service -n 30
journalctl -u 'notify-*@btrbk.service' -n 10
sudo tail /var/log/btrbk.log
```

## Restore

Single file — snapshots are plain read-only subvolumes, just copy:

```
ls /mnt/btr_pool/btrbk_snapshots/
cp -a /mnt/btr_pool/btrbk_snapshots/@home.<ts>/kuba/path/file ~/path/file
```

Whole subvolume (from kbs when local snapshots are gone):

```
sudo btrbk -c /etc/btrbk/btrbk.conf list backups                       # pick <ts>
ssh root@kbs.lan btrfs send /mnt/btrfs/omarchy/@home.<ts> | sudo btrfs receive /mnt/btr_pool/
sudo btrfs subvolume snapshot /mnt/btr_pool/@home.<ts> /mnt/btr_pool/@home.restored   # rw copy
```

Then swap: `mv @home @home.broken && mv @home.restored @home` in `/mnt/btr_pool`, reboot (fstab mounts `subvol=/@home`). Restricted key refuses `send` → use interactive root login for the pull.

## Gotchas

- Never `sudo dotter` — plain `dotter` prompts sudo itself for root-owned targets; sudo'd run breaks ownership of the rest.
- `*.pacnew` on upgrades of `omarchy-settings`, `earlyoom`, `btrfsmaintenance` (dotter owns those `/etc` files) → merge into repo (ADR 0003).
- Key regen: `sudo ssh-keygen -t ed25519 -f /etc/btrbk/ssh/id_ed25519 -N '' -C btrbk@omarchy`, replace the key part of the
  authorized_keys line on kbs (keep the options), re-accept host key via `sudo ssh -i … root@kbs.lan` (root's known_hosts).
