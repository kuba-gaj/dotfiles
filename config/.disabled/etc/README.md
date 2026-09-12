# Parked /etc (KUB-129, verdicts KUB-94)

Not deployed. Reference only.
- `systemd/network/` + `systemd-networkd-wait-online.service.d/` — laptop systemd-networkd setup (bond, macvlan, static lab NIC).
  Omarchy host runs NetworkManager; lab-NIC static IP → `nmcli` when needed.
- `systemd/system/mnt-truenas_btrbk.mount` + `sysctl.d/99-nfs-performance.conf` — TrueNAS NFS btrbk share; Linear backlog "NFS mount truenas btrbk share".
