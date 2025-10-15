sudo pacman -Rns lazygit lazydocker obsidian libreoffice-fresh obs-studio kdenlive 1password-beta 1password-cli typora spotify docker docker-compose github-cli
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
sudo pacman -S sbctl
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
curl -fsSL https://raw.githubusercontent.com/CachyOS/CachyOS-Settings/refs/heads/master/usr/bin/sbctl-batch-sign | sudo bash
sudo pacman -S scx-scheds-git
sudo systemctl enable --now scx_loader.service

sudo pacman -S zed onlyoffice-bin obs-studio-browser torbrowser-launcher github-desktop fragments lact ventoy-bin gnome-boxes
yay -S amneziavpn-bin
sudo systemctl enable --now lactd
