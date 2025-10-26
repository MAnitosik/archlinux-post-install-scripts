sudo pacman -Rns --noconfirm lazygit lazydocker obsidian libreoffice-fresh signal-desktop obs-studio kdenlive 1password-beta 1password-cli typora spotify

curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
