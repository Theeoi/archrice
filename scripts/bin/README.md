# Executable Scripts

Small utilities intended for easy use by the user. Mainly used by the [configs](../../configs) to display additional information.

- [aaudit.sh](aaudit.sh)
    - checks installed packages for known vulnerabilities and caches the number found. Used by [fastfetch](../../configs/fastfetch) to display the number of vulnerable packages.
- [vpn-status.sh](vpn-status.sh)
    - reports the active VPN connection in a format easily digested by [waybar](../../configs/waybar). Used to display an at-a-glance view if my vpn connection is active or not.
