# CachyOS settings + my own sauce - start

# https://github.com/CachyOS/CachyOS-Settings
# https://github.com/CachyOS/CachyOS-PKGBUILDS/tree/master/bpftune-git
# https://wiki.cachyos.org
# https://github.com/ImMALWARE/dns.malw.link/blob/master/hosts
# https://wiki.archlinux.org/title/Improving_performance#Turn_off_CPU_exploit_mitigations
# https://wiki.archlinux.org/title/Sysctl#Improving_performance
# https://wiki.archlinux.org/title/Systemd-resolved#DNSSEC
# https://wiki.archlinux.org/title/Systemd-resolved#DNS_over_TLS
# https://wiki.archlinux.org/title/Unified_kernel_image#Kernel_command_line
# https://github.com/ilya-zlobintsev/LACT/wiki/Overclocking-(AMD)
# https://github.com/Flowseal/zapret-discord-youtube/blob/main/.service/hosts

sudo pacman -S --noconfirm --needed appmenu-gtk-module libdbusmenu-glib

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/cmdline.d/cmdline.conf | sudo tee /etc/cmdline.d/cmdline.conf

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment | sudo tee /etc/environment

sudo pacman -S --noconfirm --needed scx-scheds scx-tools
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
sudo systemctl enable --now scx_loader.service

sudo modprobe tcp_bbr
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/98-arch.conf | sudo tee /etc/sysctl.d/98-arch.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/70-cachyos-settings.conf | sudo tee /etc/sysctl.d/70-cachyos-settings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/zram-generator.conf | sudo tee /etc/systemd/zram-generator.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/30-zram.rules | sudo tee /etc/udev/rules.d/30-zram.rules

git clone --depth 1 https://github.com/MAnitosik/CachyOS-bpftune-git.git
cd ./CachyOS-bpftune-git
makepkg -sirc
sudo systemctl enable --now bpftune

# CachyOS settings + my own sauce - end


# installing some base packages
# resources > btop, telegram-desktop > signal-desktop, video-trimmer > kdenlive (I dont need fancy functions of kdenlive)
# zed is my second code editor, torbrowser-launcher (FREE THE INTERNET), lact is for configuring a gpu, gnome-boxes is for virtual machines, gnome-firmware is for fwupd (lvfs)
# adding some basic support for windows apps with wine-staging, wine-gecko and wine-mono
# amneziavpn-bin is for VPN, v2rayn-bin is for vless, ventoy-bin is for a usb drive
# Bazaar is for flatpaks (why not)
# onlyoffice > libreoffice (onlyoffice has a more pleasure interface to me)
# Desktop Plus is for a github intergration
# https://learn.omacom.io/2/the-omarchy-manual
sudo pacman -S --noconfirm --needed resources telegram-desktop video-trimmer
sudo pacman -S --noconfirm --needed zed torbrowser-launcher lact gnome-boxes gnome-firmware
sudo pacman -S --noconfirm --needed wine-staging
sudo pacman -S --noconfirm --needed --asdeps wine-gecko wine-mono
yay -S --noconfirm --needed amneziavpn-bin v2rayn-bin ventoy-bin
flatpak install -y flathub io.github.kolunmi.Bazaar
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub io.github.pol_rivero.github-desktop-plus
sudo systemctl enable --now lactd

# installing modified omarchy hyprland configs
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy/tree/master/config/hypr
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.conf | tee ~/.config/hypr/autostart.conf

# regenerating initramfs images (why not, lol)
sudo mkinitcpio -P
