#!/usr/bin/env bash

set -e

# 일단 코드를 계속 찾아서 일단 정리 차원에서 작성함. 이후 삭제할 예정임.
kubectl get pods

kubectl get ns

kubectl get pods -n hostpath-demo

kubectl logs hostpath-demo