# Waybar

A minimal status bar that keeps essential system information visible without
cluttering the desktop.

## Screenshots
![waybar overview](/../_screenshots/v1.1.0/waybar.png)

## Highlights

- the clock sits alone on the left, while Bluetooth, audio, network, VPN, and
  battery status are grouped on the right. The empty center keeps the bar calm
  and leaves plenty of visual space.
- most modules use icons for a compact overview, with connection details kept
  in tooltips or shown only when useful, such as while charging or connected to
  a Bluetooth device.
- translucent backgrounds, muted blue borders, and rounded corners make each
  module look like a floating capsule over the wallpaper.
- the custom VPN module uses [vpn-status.sh](../../scripts/bin/vpn-status.sh) to
  show an indicator only while a VPN is active. Its connected style joins it to
  the network capsule, making the two related states easy to read together.
- CSS changes reload automatically, making visual tweaks immediately visible.
