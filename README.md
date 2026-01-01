[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MAnitosik/archlinux-post-install-scripts)

# BYPASSING ISP DPI IN RUSSIA (IN CASE YOU CAN NOT DOWNLOAD PACKAGES ETC...)
- https://github.com/MAnitosik/Russia-DPI

# WARNING
- NOT FOR NEWBIES, USE FRIENDLY LINUX DISTRIBUTIONS (LINUX MINT, FEDORA KDE ETC...)
- DOES NOT SUPPORT DUAL-BOOT (AND WILL NOT SUPPORT DUAL-BOOT)
- PRIMALY OPTIMISED FOR AMD-POWERED SYSTEMS (GPU AND CPU)
- NETWORK IS PRIMALY OPTIMISED FOR RUSSIA (ZAPRET, HOSTS FILE AND "cfg80211.ieee80211_regdom")
- MAKE SURE YOU CONFIGURE EVERYTHING YOU NEED IN ARCHINSTALL (BLUETOOTH, AUDIO ETC...)

# archinstall requirements (while installation)
- UKI + EFI stub
- Xorg + graphics drivers (archinstall profile)
- multilib

# sequence of scripts (after archinstall, in the installed OS)
- zapret.sh (optional)
- omarchy.sh / omarchy-alt.sh
- requirements.sh
- reboot
- post-install.sh
- reboot

# omarchy requirements (after scripts)
- DHCP (Omarchy Menu -> Setup -> DNS -> DHCP, required for cloudflare DoT and DNSSEC)
