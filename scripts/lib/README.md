# System Integration Scripts

Hooks intended to run automatically from system-managed locations rather than
being launched directly by the user.

## systemd/system-sleep

- [batenergy.sh](systemd/system-sleep/batenergy.sh)
    - logs how long the computer slept and how much battery energy changed during that time. The resulting sleep-drain rate makes power regressions and unexpectedly costly sleep states easier to diagnose from the journal.
- [thinkpad-bluetooth-reset.sh](systemd/system-sleep/thinkpad-bluetooth-reset.sh)
    - reapplies the ThinkPad Bluetooth software block after hibernation when firmware wakes the hardware despite Bluetooth being disabled. This keeps the user's disabled state intact and prevents unwanted radio activity.
