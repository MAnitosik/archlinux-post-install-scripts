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
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/99-sysctl.conf | sudo tee /etc/sysctl.d/99-sysctl.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/dnssec.conf | sudo tee /etc/systemd/resolved.conf.d/dnssec.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/dns_over_tls.conf | sudo tee /etc/systemd/resolved.conf.d/dns_over_tls.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/70-cachyos-settings.conf | sudo tee /etc/sysctl.d/70-cachyos-settings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/zram-generator.conf | sudo tee /etc/systemd/zram-generator.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/timesyncd.conf.d/10-timesyncd.conf | sudo tee /etc/systemd/timesyncd.conf.d/10-timesyncd.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/udev/rules.d/30-zram.rules | sudo tee /etc/udev/rules.d/30-zram.rules
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/tmpfiles.d/coredump.conf | sudo tee /etc/tmpfiles.d/coredump.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/tmpfiles.d/thp.conf | sudo tee /etc/tmpfiles.d/thp.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/tmpfiles.d/thp-shrinker.conf | sudo tee /etc/tmpfiles.d/thp-shrinker.conf

sudo pacman -S --noconfirm --needed zed telegram-desktop
sudo pacman -S --noconfirm --needed torbrowser-launcher lact gnome-boxes
yay -S --noconfirm --needed amneziavpn-bin ventoy-bin
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub io.github.pol_riveio.github.pol_rivero.github-desktop-plusro.github-desktop-plus
sudo systemctl enable --now lactd

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.conf | tee ~/.config/hypr/autostart.conf

sudo mkinitcpio -P
