#### 주석

# 지금 나는 ubuntu 를 사용해서 SELinux 가 없어서 :Z 상관없지만, 기억용으로 넣어둠. 다른 프로젝트에도 적용해야함.
# alpine 에서는 SELinux 아예 지원하지 않음.
# 컨테이너 내 사용자와 호스트 파일 소유자 불일치 발생 가능성 있음. 이 문제 해결하자.

docker run -it --network host --user root -v "${HOME}/.kube/config:/root/.kube/config" -v "$(pwd)":/workdir -e KUBECONFIG=/root/.kube/config -w /workdir --entrypoint sh bitnami/kubectl:latest

docker run --network host --user root -v "${HOME}/.kube/config:/root/.kube/config" -v "$(pwd):/workdir" -e KUBECONFIG=/root/.kube/config -w /workdir bitnami/kubectl:latest --kubeconfig=/root/.kube/config

```
#!/usr/bin/env bash

# Wrapper script to run kubectl inside a container with proper kubeconfig mount

# Directory containing host kubeconfig
KUBEDIR="${HOME}/.kube"

# Ensure .kube directory exists
mkdir -p "$KUBEDIR"

# Warn if kubeconfig file is missing
if [ ! -f "$KUBEDIR/config" ]; then
  echo "WARNING: kubeconfig not found at $KUBEDIR/config."
  echo "Please initialize cluster or copy your config there."
fi

# Run kubectl in a container using host network and root user,
# mounting the entire kube directory so config is available
exec docker run --rm \
  --network host \
  --user root \
  -v "${KUBEDIR}:/root/.kube" \
  -v "$(pwd):/workdir" \
  -e KUBECONFIG=/root/.kube/config \
  -w /workdir \
  bitnami/kubectl:latest \
  --kubeconfig=/root/.kube/config "$@"

```