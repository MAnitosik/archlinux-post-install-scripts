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

sudo pacman -S zed onlyoffice-bin telegram-desktop obs-studio-browser
sudo pacman -S github-desktop torbrowser-launcher fragments lact ventoy-bin gnome-boxes gnome-disk-utility exfatprogs
yay -S amneziavpn-bin
sudo systemctl enable --now lactd

curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | sudo tee ~/.config/hypr/bindings.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | sudo tee ~/.config/hypr/hyprsunset.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | sudo tee ~/.config/hypr/input.conf
curl https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | sudo tee ~/.config/hypr/monitors.conf
