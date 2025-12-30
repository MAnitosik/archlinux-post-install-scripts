# preparations
sudo mkdir /etc/cmdline.d
sudo mkdir /etc/sysctl.d
sudo mkdir /etc/scx_loader # sched-ext
sudo mkdir /etc/systemd/resolved.conf.d
sudo mkdir /etc/udev/rules.d

# deleting some base omarchy packages, installing flatpak and fully updating the system
# lazygit and lazydocker are not needed, obsidian is just a smart note taking app, localsend is useless for me
# 1password, typora and spotify are cringe
# https://learn.omacom.io/2/the-omarchy-manual
sudo pacman -Rns lazygit lazydocker btop obsidian localsend libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
sudo pacman -S --needed flatpak
sudo pacman -Syuu

# required for the sysctl config (98-arch.conf)
sudo modprobe tcp_bbr
