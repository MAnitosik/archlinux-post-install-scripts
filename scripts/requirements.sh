# preparations
sudo mkdir /etc/cmdline.d
sudo mkdir /etc/sysctl.d
sudo mkdir /etc/scx_loader # sched-ext
sudo mkdir /etc/systemd/resolved.conf.d
sudo mkdir /etc/udev/rules.d

# changing channels for pacman (adding V3 packages), deleting some base omarchy packages and installing flatpak
# lazygit and lazydocker are not needed, obsidian is just a smart note taking app, localsend is useless for me
# 1password, typora and spotify are cringe
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy/tree/master/default/pacman
# https://somegit.dev/ALHP/ALHP.GO
yay -S --needed alhp-keyring alhp-mirrorlist
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/pacman.conf | sudo tee /etc/pacman.conf
omarchy-channel-set edge
sudo pacman -Rns lazygit lazydocker btop obsidian localsend libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
sudo pacman -S --needed flatpak

# required for the sysctl config (98-arch.conf)
sudo modprobe tcp_bbr
