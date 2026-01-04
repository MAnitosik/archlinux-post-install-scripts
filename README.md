[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MAnitosik/archlinux-post-install-scripts)

# WARNING
- NOT FOR NEWBIES, USE FRIENDLY LINUX DISTRIBUTIONS (LINUX MINT, FEDORA KDE ETC...)
- DOES NOT SUPPORT DUAL-BOOT (AND WILL NOT SUPPORT DUAL-BOOT)
- PRIMALY OPTIMISED FOR AMD-POWERED SYSTEMS (GPU AND CPU)
- NETWORK IS PRIMALY OPTIMISED FOR RUSSIA (HOSTS FILE AND "cfg80211.ieee80211_regdom")
- MAKE SURE YOU CONFIGURE EVERYTHING YOU NEED IN ARCHINSTALL PROPERLY (BLUETOOTH, AUDIO ETC...)

# archinstall requirements (while installation)
- UKI + EFI stub
- Xorg + GPU drivers (archinstall profile, required for correct gpu drivers)
- multilib

# archinstall recommendations
- ext4 (straight performance, widest support)
- vanilla linux kernel (most of sane optimisations are done via config files, no need to use custom kernels)

# sequence of scripts (after archinstall, in the installed OS)
- git clone --depth 1 https://github.com/MAnitosik/archlinux-post-install-scripts.git
- cd ./archlinux-post-install-scripts/scripts/
- bash omarchy.sh / bash omarchy-alt.sh (omarchy will prompt you to reboot after installation, use omarchy-alt.sh in the case omarchy.sh does not work for you)
- cd ./archlinux-post-install-scripts/scripts/
- bash requirements.sh
- reboot (super + esc -> restart)
- cd ./archlinux-post-install-scripts/scripts/
- post-install.sh
- gaming.sh (optional)
- reboot (super + esc -> restart)

# omarchy requirements (after scripts)
- DHCP (Omarchy Menu -> Setup -> DNS -> DHCP, required for cloudflare DoT and DNSSEC)

# updating config files
- cd ./archlinux-post-install-scripts/
- git pull origin main
- cd ./scripts/
- bash update.sh
- reboot (super + esc -> restart)
