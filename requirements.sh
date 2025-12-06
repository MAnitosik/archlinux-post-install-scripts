sudo mkdir /etc/cmdline.d
sudo mkdir /etc/sysctl.d
sudo mkdir /etc/scx_loader
sudo mkdir /etc/systemd/resolved.conf.d
sudo mkdir /etc/systemd/timesyncd.conf.d
sudo mkdir /etc/udev/rules.d
sudo mkdir /etc/tmpfiles.d

omarchy-refresh-pacman edge
sudo pacman -Rns lazygit lazydocker obsidian libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
sudo pacman -S --needed flatpak
