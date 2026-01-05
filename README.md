[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MAnitosik/archlinux-post-install-scripts)

# WARNING
- DO NOT USE THESE SCIPTS, THEY WERE MADE FOR MYSELF AND SHOULD NOT BE USED BY ANYONE ELSE, I AM NOT RESPONSIBLE IF YOU BREAK YOUR SYSTEM SOMEHOW
- NOT FOR NEWBIES, USE FRIENDLY LINUX DISTRIBUTIONS (LINUX MINT, FEDORA KDE ETC...)
- DOES NOT SUPPORT DUAL-BOOT (AND WILL NOT SUPPORT DUAL-BOOT)
- PRIMALY OPTIMISED FOR AMD-POWERED SYSTEMS (GPU AND CPU)
- NETWORK IS PRIMALY OPTIMISED FOR RUSSIA (HOSTS FILE AND "cfg80211.ieee80211_regdom")
- MAKE SURE YOU CONFIGURE EVERYTHING YOU NEED IN ARCHINSTALL PROPERLY (BLUETOOTH, AUDIO ETC, IT IS NOT A GUIDE FOR ARCHINSTALL)

# archinstall requirements (while installation)
- UKI + EFI stub
- Xorg + GPU drivers (archinstall profile, required for correct gpu drivers)
- multilib
- swap partition (linux-swap, mostly required for laptops, choose the size of your ram)
> MAKE SURE YOU CONFIGURE EVERYTHING YOU NEED IN ARCHINSTALL PROPERLY (BLUETOOTH, AUDIO ETC, IT IS NOT A GUIDE FOR ARCHINSTALL)

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
- bash post-install.sh
- bash laptop.sh (optional)
- bash gaming.sh (optional)
- reboot (super + esc -> restart)

# omarchy requirements (after scripts)
- DHCP (Omarchy Menu -> Setup -> DNS -> DHCP, required for cloudflare DoT and DNSSEC)

# updating config files
- cd ./archlinux-post-install-scripts/
- git pull origin main
- cd ./scripts/
- bash update.sh
- reboot (super + esc -> restart)

# configuration recommendations
- Aether (pre-installed app to configure the look of your system)
- delete all web apps (my personal choice, Omarchy Menu -> Remove -> Web App -> ctrl + a -> enter -> enter)
- delete optional TUI (they will not work properly anyways, Omarchy Menu -> Remove -> TUI -> ctrl + a -> enter -> enter)
- configure your monitor in ~/.config/hypr/monitors.conf
- LACT (configure your GPU)
- configure wine in winetricks for wider windows apps support
- configure amneziavpn/throne so you can always have access to the internet
- download updates for your firmware in gnome-firmware (your device may be not available in lvfs/fwupd, it is fine)
> I do not need to tell you that you need to update your system and these config files sometimes
