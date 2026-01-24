# adding some custom variables for proton
# installing 32 bit version of gpu drivers, steam, gamescope, mangohud, protonup-qt and discord (32 bit is needed since proton and steam are 32 bit themselves still)
# https://wiki.cachyos.org
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/environment-alt | sudo tee /etc/environment
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/user-tmpfiles.d/discord.conf | sudo tee ~/.config/user-tmpfiles.d/discord.conf
sudo pacman -S --noconfirm --needed lib32-mesa lib32-vulkan-radeon
sudo pacman -S --noconfirm --needed steam gamescope mangohud lib32-mangohud goverlay
flatpak install -y flathub net.davidotek.pupgui2 com.discordapp.Discord
echo "Install custom versions of proton using protonup-qt, personally I recommend proton-cachyos (you need to open steam in the first place so protonup-qt can find your steam files location)"
echo "TIP: DO NOT ENABLE SHADER PRE-CACHING ON MODERN COMPUTERS"
touch ./gaming
