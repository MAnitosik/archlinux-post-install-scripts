# adding some custom variables for proton
# installing 32 bit version of gpu drivers, steam, gamescope, mangohud, heroic games launcher, hydra launcher, protonup-qt and discord
# https://wiki.cachyos.org
mkdir -p ~/.config/user-tmpfiles.d/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/gaming.conf | sudo tee ~/.config/environment.d/gaming.conf
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/user-tmpfiles.d/discord.conf | sudo tee ~/.config/user-tmpfiles.d/discord.conf
sudo pacman -S --noconfirm --needed lib32-mesa lib32-vulkan-radeon
sudo pacman -S --noconfirm --needed steam gamescope mangohud lib32-mangohud goverlay
yay -S --noconfirm --needed heroic-games-launcher-bin hydra-launcher-bin
flatpak install -y flathub net.davidotek.pupgui2 com.discordapp.Discord
echo "Install custom versions of proton using protonup-qt, personally I recommend proton-cachyos (you need to open steam in the first place so protonup-qt can find your steam files location)"
echo "TIP: DO NOT ENABLE SHADER PRE-CACHING ON MODERN COMPUTERS"
touch ./gaming
