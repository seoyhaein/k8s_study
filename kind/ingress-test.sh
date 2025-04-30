#!/usr/bin/env bash
set -e

kind create cluster --config kind-multi-worker.yaml

# 컨트롤플레인 노드가 Ready 상태가 될 때까지 최대 2분 대기
kubectl wait --for=condition=Ready node/kind-control-plane --timeout=120s

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
