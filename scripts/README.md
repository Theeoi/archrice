# Archrice/scripts

## Descriptions

### aaudit.sh
aaudit is a utility script for checking the number of compromised packages on your system using `arch-audit` and storing the number in a file. This file can then be read by other programs to display that information.

On my system this script is set to run daily using a systemd timer and included in my `fastfetch` config.

