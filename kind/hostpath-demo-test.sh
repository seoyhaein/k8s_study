#!/usr/bin/env bash

set -e

# --name 추가 됨.
kind create cluster --config kind-hostpath.yaml --name hostpath-demo

# 컨트롤플레인 노드가 Ready 상태가 될 때까지 최대 2분 대기
kubectl wait --for=condition=Ready node/hostpath-demo-control-plane --timeout=120s

# 또는 모든 노드가 Reday 될 때 까지 최ㅐ 2분 대기
# kubectl wait --for=condition=Ready nodes --all --timeout=120s

# kubectl apply -f hostpath-demo.yaml