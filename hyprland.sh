sudo pacman -Syu --needed hypridle hyprland hyprlang hyprlock hyprpaper mako waybar hyprpolkitagent nautilus rofi-wayland hyprshot blueman wlogout hyprpicker otf-font-awesome ly gnome-keyring xdg-desktop-portal-hyprland xdg-desktop-portal-gtk darkman
sudo systemctl enable ly
git clone --depth 1 https://github.com/FrogProg09/my-linux.git
cd my-linux/
rm -rf .git .github images/ LICENSE.md
cd DOTFILES/.config/
rm -rf kitty starship.toml
cd .. && cd ..
read -p "edit install.sh according to the hyprland.txt"
bash install.sh
