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
sudo tee -a /etc/default/limine > /dev/null <<'EOF'

KERNEL_CMDLINE[default]+=" manitosik=1 zswap.enabled=0 nowatchdog quiet splash amd_pstate=passive rcutree.enable_rcu_lazy=1 intel_pstate=passive mitigations=off amdgpu.ppfeaturemask=0xffffffff"
EOF

# configuring environment for wine and amd
# https://wiki.cachyos.org
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/environment.conf | tee ~/.config/environment.d/environment.conf > /dev/null

# using sched-ext
# https://wiki.cachyos.org
# https://wiki.archlinux.org/title/Improving_performance#CPU_scheduler
sudo pacman -S --noconfirm --needed scx-scheds scx-tools
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
sudo systemctl enable --now scx_loader.service

# configuring network
# https://wiki.archlinux.org/title/Sysctl#Improving_performance
# https://wiki.archlinux.org/title/Sysctl#TCP/IP_stack_hardening
# https://github.com/Flowseal/zapret-discord-youtube/blob/main/.service/hosts
# https://man.archlinux.org/man/hosts.5.en
# https://github.com/ImMALWARE/dns.malw.link/blob/master/hosts
# https://wiki.archlinux.org/title/Systemd-resolved#DNSSEC
# https://wiki.archlinux.org/title/Systemd-resolved#Fallback
# https://wiki.archlinux.org/title/Systemd-resolved#DNS_over_TLS
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/modules-load.d/tcp-bbr.conf | sudo tee /etc/modules-load.d/tcp-bbr.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/98-arch.conf | sudo tee /etc/sysctl.d/98-arch.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf > /dev/null

# using cachyos settings
# https://github.com/CachyOS/CachyOS-Settings
yay -S --asdeps --noconfirm --needed cachyos-ananicy-rules
url=$(curl -sfL --compressed "https://packages.cachyos.org/package/cachyos/any/cachyos-settings" | grep -aoE "https://[^\"'[:space:]<>]+cachyos-settings[^\"'[:space:]<>]+\.pkg\.tar\.[a-zA-Z0-9]+" | head -n 1) && [ -n "$url" ] && curl -sfLo "cachyos-settings.pkg${url##*.pkg}" "$url"
sudo pacman -U --noconfirm --needed ./cachyos-settings.pkg.tar.zst
sudo systemctl disable --now ananicy-cpp

# configuring upower and logind for laptops
# https://wiki.archlinux.org/title/Laptop#UPower
# https://gitlab.freedesktop.org/upower/upower
# https://wiki.archlinux.org/title/Power_management#ACPI_events
# https://github.com/systemd/systemd
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/UPower/UPower.conf | sudo tee /etc/UPower/UPower.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/logind.conf.d/logind.conf | sudo tee /etc/systemd/logind.conf.d/logind.conf > /dev/null

# setting cpu governor to schedutil
# https://wiki.archlinux.org/title/CPU_frequency_scaling#cpupower
sudo pacman -S --noconfirm --needed cpupower
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/default/cpupower-service.conf | sudo tee /etc/default/cpupower-service.conf > /dev/null
sudo systemctl enable --now cpupower

# installing bpftune by oracle
# https://github.com/CachyOS/CachyOS-PKGBUILDS
url=$(curl -sfL --compressed "https://packages.cachyos.org/package/cachyos/x86_64/bpftune-git" | grep -aoE "https://[^\"'[:space:]<>]+bpftune-git[^\"'[:space:]<>]+\.pkg\.tar\.[a-zA-Z0-9]+" | head -n 1) && [ -n "$url" ] && curl -sfLo "bpftune-git.pkg${url##*.pkg}" "$url"
sudo pacman -U --noconfirm --needed ./bpftune-git.pkg.tar.zst
sudo systemctl enable --now bpftune

# Optimizations - end


# installing some base packages
# zed is my main code editor, brave-origin is my main browser
# resources > btop, amberol > cliamp, telegram-desktop > signal-desktop, video-trimmer > kdenlive
# torbrowser-launcher for tor, lact is for configuring a gpu, gnome-boxes is for virtual machines, gnome-firmware is for fwupd, pycharm is for python
# ventoy-bin is for a usb drive, amneziavpn-bin is for VPN
# Bazaar is for flatpaks
# onlyoffice > libreoffice
# Desktop Plus is for a github intergration, gearlever is for managing appimages
# v2raya is for proxies
# making zed and brave-origin defaults for system
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
# https://github.com/ilya-zlobintsev/LACT
omarchy-install-zed
omarchy-install-browser brave-origin
sudo pacman -S --noconfirm --needed resources amberol telegram-desktop video-trimmer
sudo pacman -S --noconfirm --needed torbrowser-launcher lact gnome-boxes gnome-firmware pycharm-community-edition
yay -S --noconfirm --needed ventoy-bin amneziavpn-bin
flatpak install -y flathub io.github.kolunmi.Bazaar
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub io.github.pol_rivero.github-desktop-plus it.mijorus.gearlever
sudo sh -c "$(curl -Ls https://github.com/v2rayA/v2rayA-installer/raw/main/installer.sh)" @ --with-xray
sudo systemctl enable --now lactd
sudo systemctl enable --now v2raya
omarchy-default-editor zed
omarchy-default-browser brave-origin

# adding some basic support for windows apps with bottles, wine-staging (+deps) and winetricks (+deps)
flatpak install -y flathub com.usebottles.bottles
sudo pacman -S --noconfirm --needed wine-staging
sudo pacman -S --noconfirm --needed --asdeps wine-gecko wine-mono gnutls sdl2-compat gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg samba
sudo pacman -S --noconfirm --needed winetricks
sudo pacman -S --noconfirm --needed --asdeps zenity
winetricks -q gmdls dsound directmusic
winetricks -q fontsmooth=rgb
winetricks -q dxvk
winetricks -q vkd3d

# installing modified omarchy hyprland configs
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.lua | tee ~/.config/hypr/bindings.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.lua | tee ~/.config/hypr/input.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.lua | tee ~/.config/hypr/monitors.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.lua | tee ~/.config/hypr/autostart.lua > /dev/null

# installing additional kernels
sudo pacman -S --noconfirm --needed linux-lts
sudo pacman -S --noconfirm --needed dkms
sudo pacman -S --noconfirm --needed --asdeps linux-headers linux-lts-headers

# regenerating initramfs images
sudo limine-mkinitcpio
