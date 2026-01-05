# Optimisations - start

# some deps for apps (took from post install recommendations)
# https://wiki.cachyos.org
sudo pacman -S --noconfirm --needed appmenu-gtk-module libdbusmenu-glib

# configuring kernel command line (took most of settings from cachyos wiki, regulatory domain is set to russia)
# https://wiki.cachyos.org
# https://wiki.archlinux.org/title/CPU_frequency_scaling#amd_pstate
# https://wiki.archlinux.org/title/Improving_performance#Turn_off_CPU_exploit_mitigations
# https://wiki.archlinux.org/title/Unified_kernel_image#Kernel_command_line
# https://wiki.archlinux.org/title/Improving_performance#Regulatory_domain
# https://github.com/ilya-zlobintsev/LACT
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/cmdline.d/cmdline.conf | sudo tee /etc/cmdline.d/cmdline.conf

# configuring environment for wine and amd (took from gaming section, settings still may be useful for casual users too)
# https://wiki.cachyos.org
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment | sudo tee /etc/environment

# using sched-ext (mostly took from cachyos guide on sched-ext, but also took a lot of info from official sched-ext resources)
# https://wiki.cachyos.org
# https://wiki.archlinux.org/title/Improving_performance#CPU_scheduler
sudo pacman -S --noconfirm --needed scx-scheds scx-tools
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
sudo systemctl enable --now scx_loader.service

# configuring network (mostly for russia)
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

# using cachyos settings (took only settings related to ram, kernel and scheduler)
# https://github.com/CachyOS/CachyOS-Settings
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/70-cachyos-settings.conf | sudo tee /etc/sysctl.d/70-cachyos-settings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/zram-generator.conf | sudo tee /etc/systemd/zram-generator.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/30-zram.rules | sudo tee /etc/udev/rules.d/30-zram.rules

# configuring upower for laptops (took default config from gitlab and location of config from archwiki)
# https://wiki.archlinux.org/title/Laptop#UPower
# https://gitlab.freedesktop.org/upower/upower
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/UPower/UPower.conf | sudo tee /etc/UPower/UPower.conf

# setting cpu governor to schedutil (took from archwiki, note: needed to configure bpfland to work with schedutil)
# https://gitlab.archlinux.org/archlinux/packaging/packages/linux-tools
# https://wiki.archlinux.org/title/CPU_frequency_scaling#cpupower
sudo pacman -S --noconfirm --needed cpupower
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/default/cpupower | sudo tee /etc/default/cpupower
sudo systemctl enable --now cpupower

# installing bpftune by oracle (useful for configuring sysctl on the fly without any manual intervention)
# https://github.com/CachyOS/CachyOS-PKGBUILDS
git clone --depth 1 https://github.com/MAnitosik/CachyOS-bpftune-git.git
makepkg -sirc --dir ./CachyOS-bpftune-git
sudo systemctl enable --now bpftune

# Optimisations - end


# installing some base packages
# resources > btop, telegram-desktop > signal-desktop, video-trimmer > kdenlive (I dont need fancy functions of kdenlive)
# zed is my second code editor, torbrowser-launcher (FREE THE INTERNET), lact is for configuring a gpu, gnome-boxes is for virtual machines, gnome-firmware is for fwupd (lvfs)
# amneziavpn-bin is for VPN, throne-bin is for vless, ventoy-bin is for a usb drive
# Bazaar is for flatpaks (why not)
# onlyoffice > libreoffice (onlyoffice has a more pleasure interface to me)
# Desktop Plus is for a github intergration
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
# https://github.com/ilya-zlobintsev/LACT
sudo pacman -S --noconfirm --needed resources telegram-desktop video-trimmer
sudo pacman -S --noconfirm --needed zed torbrowser-launcher lact gnome-boxes gnome-firmware
yay -S --noconfirm --needed amneziavpn-bin throne-bin ventoy-bin
flatpak install -y flathub io.github.kolunmi.Bazaar
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub io.github.pol_rivero.github-desktop-plus
sudo systemctl enable --now lactd

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

# regenerating initramfs images (why not, lol)
sudo mkinitcpio -P
