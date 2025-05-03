#!/usr/bin/env bash
set -euo pipefail

# 이전 내용 전부 삭제
sudo rm -rf /mnt/kind-demo

# 새로 디렉터리 만들고 파일 생성
sudo mkdir -p /mnt/kind-demo

echo "hello from host" | sudo tee /mnt/kind-demo/hello.txt >/dev/null
