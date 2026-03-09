# Optimizations - start

# some deps for apps
# https://wiki.cachyos.org
sudo pacman -S --noconfirm --needed appmenu-gtk-module libdbusmenu-glib

# configuring kernel command line
# https://wiki.cachyos.org
# https://wiki.archlinux.org/title/CPU_frequency_scaling#amd_pstate
# https://wiki.archlinux.org/title/Improving_performance#Turn_off_CPU_exploit_mitigations
# https://wiki.archlinux.org/title/Unified_kernel_image#Kernel_command_line
# https://wiki.archlinux.org/title/Improving_performance#Regulatory_domain
# https://github.com/ilya-zlobintsev/LACT
CMDLINE=KERNEL_CMDLINE[default]+=" manitosik=1 zswap.enabled=0 nowatchdog quiet splash amd-pstate=passive rcutree.enable_rcu_lazy=1 amdgpu.ppfeaturemask=0xffffffff mitigations=off cfg80211.ieee80211_regdom=RU"
echo '' >> /etc/default/limine
echo $CMDLINE >> /etc/default/limine

# configuring environment for wine and amd
# https://wiki.cachyos.org
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/environment.conf | tee ~/.config/environment.d/environment.conf

# using sched-ext
# https://wiki.cachyos.org
# https://wiki.archlinux.org/title/Improving_performance#CPU_scheduler
sudo pacman -S --noconfirm --needed scx-scheds scx-tools
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
sudo systemctl enable --now scx_loader.service

# configuring network
# https://wiki.archlinux.org/title/Sysctl#Improving_performance
# https://github.com/Flowseal/zapret-discord-youtube/blob/main/.service/hosts
# https://man.archlinux.org/man/hosts.5.en
# https://github.com/ImMALWARE/dns.malw.link/blob/master/hosts
# https://wiki.archlinux.org/title/Systemd-resolved#DNSSEC
# https://wiki.archlinux.org/title/Systemd-resolved#DNS_over_TLS
sudo modprobe tcp_bbr
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/98-arch.conf | sudo tee /etc/sysctl.d/98-arch.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf

# using some cachyos settings
# https://github.com/CachyOS/CachyOS-Settings
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/70-cachyos-settings.conf | sudo tee /etc/sysctl.d/70-cachyos-settings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/zram-generator.conf | sudo tee /etc/systemd/zram-generator.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/30-zram.rules | sudo tee /etc/udev/rules.d/30-zram.rules

# configuring upower and logind for laptops
# https://wiki.archlinux.org/title/Laptop#UPower
# https://gitlab.freedesktop.org/upower/upower
# https://wiki.archlinux.org/title/Power_management#ACPI_events
# https://github.com/systemd/systemd
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/UPower/UPower.conf | sudo tee /etc/UPower/UPower.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/logind.conf.d/logind.conf | sudo tee /etc/systemd/logind.conf.d/logind.conf

# setting cpu governor to schedutil
# https://wiki.archlinux.org/title/CPU_frequency_scaling#cpupower
sudo pacman -S --noconfirm --needed cpupower
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/default/cpupower-service.conf | sudo tee /etc/default/cpupower-service.conf
sudo systemctl enable --now cpupower

# installing bpftune by oracle
# https://github.com/CachyOS/CachyOS-PKGBUILDS
git clone --depth 1 https://github.com/MAnitosik/CachyOS-bpftune-git.git
makepkg -sirc --dir ./CachyOS-bpftune-git
sudo systemctl enable --now bpftune

# Optimizations - end


# installing some base packages
# resources > btop, telegram-desktop > signal-desktop, video-trimmer > kdenlive
# zed is my second code editor, torbrowser-launcher for tor, lact is for configuring a gpu, gnome-boxes is for virtual machines, gnome-firmware is for fwupd
# ventoy-bin is for a usb drive, amneziavpn-bin is for VPN
# Bazaar is for flatpaks
# onlyoffice > libreoffice
# Desktop Plus is for a github intergration
# v2raya is for proxies
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
# https://github.com/ilya-zlobintsev/LACT
sudo pacman -S --noconfirm --needed resources telegram-desktop video-trimmer
sudo pacman -S --noconfirm --needed zed torbrowser-launcher lact gnome-boxes gnome-firmware
yay -S --noconfirm --needed ventoy-bin amneziavpn-bin
flatpak install -y flathub io.github.kolunmi.Bazaar
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub io.github.pol_rivero.github-desktop-plus
sudo sh -c "$(curl -Ls https://github.com/v2rayA/v2rayA-installer/raw/main/installer.sh)" @ --with-xray
sudo systemctl enable --now lactd
sudo systemctl enable --now v2raya

# adding some basic support for windows apps with wine-staging (+deps) and winetricks (+deps)
sudo pacman -S --noconfirm --needed wine-staging
sudo pacman -S --noconfirm --needed --asdeps wine-gecko wine-mono gnutls sdl2-compat gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg samba
sudo pacman -S --noconfirm --needed winetricks
sudo pacman -S --noconfirm --needed --asdeps zenity
winetricks fontsmooth=rgb
winetricks dxvk
winetricks vkd3d

# installing modified omarchy hyprland configs
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.conf | tee ~/.config/hypr/autostart.conf

# regenerating initramfs images
sudo limine-mkinitcpio
