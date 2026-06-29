curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf | sudo tee /etc/makepkg.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf.d/rust.conf | sudo tee /etc/makepkg.conf.d/rust.conf > /dev/null

sudo sh -c "$(curl -Ls https://github.com/v2rayA/v2rayA-installer/raw/main/installer.sh)" @ --with-xray
sudo systemctl enable --now v2raya

sudo sed -i '/manitosik=1/c\KERNEL_CMDLINE[default]+=" manitosik=1 zswap.enabled=0 nowatchdog quiet splash amd_pstate=passive rcutree.enable_rcu_lazy=1 intel_pstate=passive mitigations=off amdgpu.ppfeaturemask=0xffffffff"' /etc/default/limine > /dev/null

if [[ -e "./gaming" ]]; then
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/environment.conf | tee ~/.config/environment.d/environment.conf > /dev/null
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/gaming.conf | tee ~/.config/environment.d/gaming.conf > /dev/null
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/user-tmpfiles.d/discord.conf | tee ~/.config/user-tmpfiles.d/discord.conf > /dev/null
else
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/config/environment.d/environment.conf | tee ~/.config/environment.d/environment.conf > /dev/null
fi

if [[ -e "./laptop" ]]; then
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config-alt.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
else
    curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
fi

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/modules-load.d/tcp-bbr.conf | sudo tee /etc/modules-load.d/tcp-bbr.conf > dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/98-arch.conf | sudo tee /etc/sysctl.d/98-arch.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf > /dev/null

url=$(curl -sL --compressed "https://packages.cachyos.org/package/cachyos/any/cachyos-ananicy-rules" | grep -oaE 'https://[^"[:space:]]+cachyos-ananicy-rules[^"[:space:]]+\.pkg\.tar\.[a-z0-9]+' | head -n1) && [ -n "$url" ] && curl -Lo "cachyos-ananicy-rules.pkg.tar.${url##*.pkg.tar.}" "$url"
sudo pacman -U --asdeps ./cachyos-ananicy-rules.pkg.tar.zst
url=$(curl -sL --compressed "https://packages.cachyos.org/package/cachyos/any/cachyos-settings" | grep -ao 'https://[^"<> ]*cachyos-settings-[^"<> ]*\.pkg\.tar\.[a-zA-Z0-9]*' | head -n 1) && [ -n "$url" ] && curl -Lo "cachyos-settings.pkg.tar.${url##*.pkg.tar.}" "$url"
sudo pacman -U ./cachyos-settings.pkg.tar.zst
sudo systemctl disable --now ananicy-cpp

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/UPower/UPower.conf | sudo tee /etc/UPower/UPower.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/logind.conf.d/logind.conf | sudo tee /etc/systemd/logind.conf.d/logind.conf > /dev/null

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/default/cpupower-service.conf | sudo tee /etc/default/cpupower-service.conf > /dev/null
sudo systemctl enable --now cpupower

url=$(curl -sf --compressed "https://packages.cachyos.org/package/cachyos/x86_64/bpftune-git" | grep -aoE "https://[^\"'[:space:]<>]+bpftune-git[^\"'[:space:]<>]+\.pkg\.tar\.[a-z0-9]+" | head -n1) && [ -n "$url" ] && curl -fLo "bpftune-git.pkg${url##*.pkg}" "$url"
sudo pacman -U ./bpftune-git.pkg.tar.zst
sudo systemctl enable --now bpftune

curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/bindings.lua | tee ~/.config/hypr/bindings.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/hyprsunset.conf | tee ~/.config/hypr/hyprsunset.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/input.lua | tee ~/.config/hypr/input.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/monitors.lua | tee ~/.config/hypr/monitors.lua > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/hypr/autostart.lua | tee ~/.config/hypr/autostart.lua > /dev/null

sudo limine-mkinitcpio
