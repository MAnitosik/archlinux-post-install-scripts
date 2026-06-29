curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/modules-load.d/tcp-bbr.conf | sudo tee /etc/modules-load.d/tcp-bbr.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/hosts | sudo tee /etc/hosts > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/sysctl.d/98-arch.conf | sudo tee /etc/sysctl.d/98-arch.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/archlinux-post-install-scripts/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf > /dev/null
