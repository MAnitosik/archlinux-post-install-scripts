sudo pacman -S --noconfirm --needed cachyos-settings
sudo systemctl enable --now pci-latency.service

sudo pacman -S --noconfirm --needed appmenu-gtk-module libdbusmenu-glib

sudo mkdir /etc/cmdline.d
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/cmdline.d/cmdline.conf | sudo tee /etc/cmdline.d/cmdline.conf

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment | sudo tee /etc/environment

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/99-splitlock.conf | sudo tee /etc/sysctl.d/99-splitlock.conf

sudo pacman -S --noconfirm --needed scx-scheds scx-tools
sudo mkdir /etc/scx_loader
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
sudo systemctl enable --now scx_loader.service

sudo modprobe tcp_bbr
sudo pacman -S --noconfirm --needed zed onlyoffice-bin telegram-desktop obs-studio-browser
sudo pacman -S --noconfirm --needed github-desktop torbrowser-launcher fragments lact ventoy-bin gnome-boxes
yay -S --noconfirm --needed amneziavpn-bin
sudo systemctl enable --now lactd
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/99-sysctl.conf | sudo tee /etc/sysctl.d/99-sysctl.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/dnssec.conf | sudo tee /etc/systemd/resolved.conf.d/dnssec.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/dns_over_tls.conf | sudo tee /etc/systemd/resolved.conf.d/dns_over_tls.conf

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.conf | tee ~/.config/hypr/autostart.conf

sudo mkinitcpio -P
