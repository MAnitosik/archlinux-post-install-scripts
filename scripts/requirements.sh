# preparations
sudo mkdir /etc/cmdline.d/
sudo mkdir /etc/sysctl.d/
sudo mkdir /etc/scx_loader/ # sched-ext
sudo mkdir /etc/systemd/resolved.conf.d/
sudo mkdir /etc/udev/rules.d/
sudo mkdir /etc/makepkg.conf.d/
sudo mkdir /etc/UPower/
sudo mkdir /etc/default/

# changing the update channel to the stable branch, deleting some base omarchy packages, installing flatpak and fully updating the system
# lazygit and lazydocker are not needed, obsidian is just a smart note taking app, localsend is useless for me
# 1password, typora and spotify are cringe
# deleting PPD in favor of cpupower
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
sudo pacman -Rns lazygit lazydocker btop obsidian localsend libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
rm ~/.local/share/applications/typora.desktop
sudo systemctl disable --now power-profiles-daemon
sudo pacman -Rns power-profiles-daemon
sudo pacman -Syuu
sudo pacman -S --needed flatpak

# making sure some packages are installed for configs (these packages should be installed by default)
# https://wiki.archlinux.org/title/Laptop#UPower
sudo pacman -S --needed upower zram-generator
sudo systemctl enable --now upower

# configuring makepkg
# https://github.com/CachyOS/CachyOS-PKGBUILDS
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf | sudo tee /etc/makepkg.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf.d/rust.conf | sudo tee /etc/makepkg.conf.d/rust.conf
