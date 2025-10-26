sudo pacman -S --noconfirm --needed cachyos-settings

sudo pacman -S --noconfirm --needed sbctl
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl-batch-sign

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment | sudo tee /etc/environment

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/99-splitlock.conf | sudo tee /etc/sysctl.d/99-splitlock.conf

systemctl disable --now ananicy-cpp
sudo pacman -S --noconfirm --needed scx-scheds-git
sudo mkdir /etc/scx_loader
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml
sudo systemctl enable --now scx_loader.service

sudo pacman -S --noconfirm --needed zed onlyoffice-bin telegram-desktop obs-studio-browser
sudo pacman -S --noconfirm --needed github-desktop torbrowser-launcher fragments lact ventoy-bin gnome-boxes exfatprogs
yay -S --noconfirm --needed amneziavpn-bin oniux
sudo systemctl enable --now lactd
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.conf | tee ~/.config/hypr/bindings.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.conf | tee ~/.config/hypr/input.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.conf | tee ~/.config/hypr/monitors.conf
