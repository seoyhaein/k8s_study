#!/usr/bin/env bash
set -euo pipefail

# 1) systemd user 서비스에 Delegate=yes 설정
echo ">> Creating systemd override for user@.service"
sudo mkdir -p /etc/systemd/system/user@.service.d/
sudo tee /etc/systemd/system/user@.service.d/delegate.conf > /dev/null <<'EOF'
[Service]
Delegate=yes
EOF

# 2) systemd 데몬 재로드
echo ">> Reloading systemd daemon"
sudo systemctl daemon-reload

# 3) rootless Docker/Podman 재시작
echo ">> Restarting rootless Docker (if applicable)"
systemctl --user restart docker || echo "  • docker user service not running"

echo ">> Restarting rootless Podman (if applicable)"
systemctl --user restart podman || echo "  • podman user service not running"

echo "Delegate=yes has been configured. Please try running 'kind create cluster' again."
