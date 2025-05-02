#!/usr/bin/env bash
set -euo pipefail

# Kind 클러스터 이름 목록 조회
clusters=$(kind get clusters)

# 클러스터가 없으면 종료
if [[ -z "$clusters" ]]; then
  echo "✅ No Kind clusters to delete."
  exit 0
fi

# 각 클러스터 삭제
echo "🔄 Deleting all Kind clusters..."
for cluster in $clusters; do
  echo "  • Deleting cluster: $cluster"
  kind delete cluster --name "$cluster"
done

echo "✅ All Kind clusters deleted."
