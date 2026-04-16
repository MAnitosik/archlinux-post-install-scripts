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

# removing web apps and some TUI apps
# removing npx stubs
# deleting some base omarchy packages, installing flatpak and fully updating the system
# I dont need claude-code and opencode, lazygit and lazydocker are not needed, obsidian is just a smart note taking app, localsend is useless for me
# 1password, typora and spotify are cringe
# deleting PPD, since I will use cpupower
# https://learn.omacom.io/2/the-omarchy-manual
# https://github.com/basecamp/omarchy
omarchy-webapp-remove-all
omarchy-tui-remove-all
rm -f ~/.local/bin/codex ~/.local/bin/gemini ~/.local/bin/copilot ~/.local/bin/opencode ~/.local/bin/playwright-cli ~/.local/bin/pi
sudo pacman -Rns opencode claude-code lazygit lazydocker btop obsidian localsend libreoffice-fresh signal-desktop kdenlive 1password-beta 1password-cli typora spotify
rm -f ~/.local/share/applications/typora.desktop
sudo systemctl disable --now power-profiles-daemon
sudo pacman -Rns power-profiles-daemon
sudo pacman -Syuu
sudo pacman -S --needed flatpak

# configuring makepkg
# https://github.com/CachyOS/CachyOS-PKGBUILDS
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf | sudo tee /etc/makepkg.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/makepkg.conf.d/rust.conf | sudo tee /etc/makepkg.conf.d/rust.conf > /dev/null
