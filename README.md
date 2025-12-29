[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MAnitosik/archlinux-post-install-scripts)

# WARNING
- PRIMALY OPTIMISED FOR AMD-POWERED SYSTEMS (GPU AND CPU)
- MAKE SURE YOU CONFIGURED EVERYTHING YOU NEED IN ARCHINSTALL (BLUETOOTH, AUDIO ETC...)

# archinstall requirements
- UKI
- EFI stub
- Xorg + graphics drivers (profile)
- multilib
- x86-64-v3 capable CPU

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
