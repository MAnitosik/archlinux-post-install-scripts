curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/scx_loader/config-alt.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
echo "This script only changes the behavior of sched-ext for powersave"
touch ./laptop
