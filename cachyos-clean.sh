sudo pacman -Syu --needed sbctl appmenu-gtk-module libdbusmenu-glib apparmor apparmor.d-git scx-scheds-git librewolf-bin torbrowser-launcher zed amberol fragments obs-studio-browser showtime lact gparted loupe resources gnome-boxes ventoy-bin flatpak
sudo pacman -Syu --needed --asdeps wl-clipboard
paru -Syu --needed materialgram-bin goofcord-bin amneziavpn-bin github-desktop-plus-bin
flatpak install flathub org.onlyoffice.desktopeditors dev.qwery.AddWater
tldr --update
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl-batch-sign
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo systemctl enable --now apparmor lactd
