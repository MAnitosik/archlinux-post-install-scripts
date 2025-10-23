sudo pacman -Rns lazygit lazydocker obsidian libreoffice-fresh signal-desktop obs-studio kdenlive 1password-beta 1password-cli typora spotify

curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
sudo pacman -S sbctl
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
curl -fsSL https://raw.githubusercontent.com/CachyOS/CachyOS-Settings/refs/heads/master/usr/bin/sbctl-batch-sign | sudo bash
sudo pacman -S scx-scheds-git
sudo systemctl enable --now scx_loader.service

sudo mkdir /etc/scx_loader
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/99-splitlock.conf | sudo tee /etc/sysctl.d/99-splitlock.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment | sudo tee /etc/environment
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts

sudo pacman -S zed onlyoffice-bin telegram-desktop obs-studio-browser
sudo pacman -S github-desktop torbrowser-launcher fragments lact ventoy-bin gnome-boxes exfatprogs
yay -S amneziavpn-bin
sudo systemctl enable --now lactd

curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
