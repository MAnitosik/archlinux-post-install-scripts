# preparations
mkdir -p ~/.config/environment.d/
sudo mkdir -p /etc/default/
sudo mkdir -p /etc/sysctl.d/
sudo mkdir -p /etc/scx_loader/
sudo mkdir -p /etc/systemd/logind.conf.d/
sudo mkdir -p /etc/systemd/resolved.conf.d/
sudo mkdir -p /etc/udev/rules.d/
sudo mkdir -p /etc/makepkg.conf.d/
sudo mkdir -p /etc/UPower/

# deleting some base omarchy packages, installing flatpak and fully updating the system
# lazygit and lazydocker are not needed, obsidian is just a smart note taking app, localsend is useless for me
# 1password, typora and spotify are cringe
# deleting PPD, since I will use cpupower
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
sudo pacman -Rns lazygit lazydocker btop obsidian localsend libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
rm ~/.local/share/applications/typora.desktop
sudo systemctl disable --now power-profiles-daemon
sudo pacman -Rns power-profiles-daemon
sudo pacman -Syuu
sudo pacman -S --needed flatpak

# configuring makepkg
# https://github.com/CachyOS/CachyOS-PKGBUILDS
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf | sudo tee /etc/makepkg.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf.d/rust.conf | sudo tee /etc/makepkg.conf.d/rust.conf
