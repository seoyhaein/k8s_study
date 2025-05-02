#!/usr/bin/env bash
set -euo pipefail

# 이전 내용 전부 삭제
rm -rf /mnt/kind-demo

# 새로 디렉터리 만들고 파일 생성
mkdir -p /mnt/kind-demo
echo "hello from host" > /mnt/kind-demo/hello.txt
