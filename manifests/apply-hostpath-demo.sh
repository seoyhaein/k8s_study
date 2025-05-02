#!/usr/bin/env bash
set -euo pipefail

# 스크립트 위치 기준으로 상대 경로 처리
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 0. 호스트 디렉터리 준비 스크립트 실행
echo "⏳ Preparing host directory..."
if [[ ! -x "${SCRIPT_DIR}/make-hostdir.sh" ]]; then
  chmod +x "${SCRIPT_DIR}/make-hostdir.sh"
fi
"${SCRIPT_DIR}/make-hostdir.sh"

# 1. Namespace 적용
NAMESPACE_FILE="namespace.yaml"
POD_FILE="hostpath-demo.yaml"
NAMESPACE="hostpath-demo"
POD_NAME="hostpath-demo"

echo "⏳ Applying Namespace..."
kubectl apply -f "${NAMESPACE_FILE}"

echo "⏳ Waiting for Namespace '${NAMESPACE}' to become Active..."
while true; do
  phase=$(kubectl get ns "${NAMESPACE}" -o jsonpath='{.status.phase}' 2>/dev/null || echo "")
  if [[ "${phase}" == "Active" ]]; then
    echo "✅ Namespace '${NAMESPACE}' is Active"
    break
  fi
  sleep 1
done

# 2. Pod 매니페스트 적용
echo "⏳ Applying Pod manifest..."
kubectl apply -f "${POD_FILE}"

# 3. Pod Ready 대기
echo "⏳ Waiting for Pod '${POD_NAME}' to be Ready in namespace '${NAMESPACE}'..."
kubectl wait --for=condition=Ready "pod/${POD_NAME}" -n "${NAMESPACE}" --timeout=120s

echo "✅ Pod '${POD_NAME}' is Ready"
