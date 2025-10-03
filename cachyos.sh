sudo pacman -S sbctl
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl-batch-sign
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo pacman -S appmenu-gtk-module libdbusmenu-glib
sudo pacman -S apparmor apparmor.d-git
sudo systemctl enable --now apparmor.service
tldr --update
sudo pacman -S scx-scheds-git

sudo pacman -S librewolf-bin
sudo pacman -S torbrowser-launcher
sudo pacman -S zed
sudo pacman -S amberol
sudo pacman -S fragments
sudo pacman -S obs-studio-browser
sudo pacman -S showtime
sudo pacman -S lact
sudo pacman -S gparted
sudo pacman -S loupe
sudo pacman -S resources
sudo pacman -S gnome-boxes
sudo pacman -S ventoy-bin
sudo pacman -S --asdeps wl-clipboard
sudo systemctl enable --now lactd

paru -S materialgram-bin
paru -S goofcord-bin
paru -S amneziavpn-bin
paru -S github-desktop-plus-bin

sudo pacman -S flatpak
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub dev.qwery.AddWater
