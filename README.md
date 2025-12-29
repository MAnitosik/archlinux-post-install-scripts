[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MAnitosik/archlinux-post-install-scripts)

# WARNING
- NOT FOR NEWBIES, USE FRIENDLY LINUX DISTRIBUTIONS (LINUX MINT, FEDORA KDE ETC...)
- DOES NOT SUPPORT DUAL-BOOT (AND WILL NOT SUPPORT DUAL-BOOT)
- PRIMALY OPTIMISED FOR AMD-POWERED SYSTEMS (GPU AND CPU)
- MAKE SURE YOU CONFIGURE EVERYTHING YOU NEED IN ARCHINSTALL (BLUETOOTH, AUDIO ETC...)

# hardware requirements
- x86-64-v3 capable CPU

# archinstall requirements (while installation)
- UKI
- EFI stub
- Xorg + graphics drivers (archinstall profile)
- multilib

# archinstall recommendations (optional, for the best performance)
- filesystem: xfs / ext4
- kernel: linux-zen

# sequence of scripts
- zapret.sh (optional)
- omarchy.sh / omarchy-alt.sh
- requirements.sh
- reboot
- post-install.sh
- reboot

# omarchy requirements (after scripts)
- DHCP
