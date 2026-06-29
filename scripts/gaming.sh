# adding some custom variables for proton
# installing different gpu drivers, steam, gamescope, mangohud, heroic games launcher, hydra launcher, custom proton versions, blender, godot, minecraft and discord
# https://wiki.cachyos.org
mkdir -p ~/.config/user-tmpfiles.d/
mkdir -p ~/.config/environment.d/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/gaming.conf | tee ~/.config/environment.d/gaming.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/user-tmpfiles.d/discord.conf | tee ~/.config/user-tmpfiles.d/discord.conf > /dev/null
sudo pacman -S --noconfirm --needed mesa vulkan-radeon xf86-video-amdgpu vulkan-intel intel-media-driver lib32-mesa lib32-vulkan-radeon lib32-vulkan-intel rocm-opencl-runtime intel-compute-runtime hip-runtime-amd hiprt rocm-smi-lib
yay -S --noconfirm --needed intel-level-zero-raytracing-support
sudo pacman -S --noconfirm --needed steam gamescope mangohud lib32-mangohud goverlay blender godot-mono
sudo pacman -S --noconfirm --needed umu-launcher
yay -S --noconfirm --needed proton-cachyos-slr proton-ge-custom-bin
yay -S --noconfirm --needed heroic-games-launcher-bin hydra-launcher-bin
yay -S --noconfirm --needed jdk-temurin elyprismlauncher-bin
flatpak install -y flathub com.discordapp.Discord
echo "TIP: DO NOT ENABLE SHADER PRE-CACHING ON MODERN COMPUTERS"
touch ./gaming
