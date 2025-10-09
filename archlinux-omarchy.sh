sudo pacman -Rns obsidian 1password-beta 1password-cli spotify lazygit lazydocker typora docker docker-compose github-cli libreoffice-fresh kdenlive obs-studio
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
sudo pacman -S scx-scheds-git
sudo systemctl enable --now scx_loader.service
sudo pacman -S sbctl
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
curl -fsSL https://raw.githubusercontent.com/CachyOS/CachyOS-Settings/refs/heads/master/usr/bin/sbctl-batch-sign | sudo bash

sudo pacman -S onlyoffice-bin obs-studio-browser torbrowser-launcher
yay -S amneziavpn-bin
