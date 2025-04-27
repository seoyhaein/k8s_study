# k8s_study

### kind install

```
kind is a tool for running local Kubernetes clusters using Docker container "nodes". kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

If you have go 1.16+ and docker, podman or nerdctl installed go install sigs.k8s.io/kind@v0.27.0 && kind create cluster is all you need!
```

여기서, go install sigs.k8s.io/kind@v0.27.0 로 최신 kind 를 설치를 진행함. kind create cluster 같은 경우는 마스터 노드(컨트롤 플레인 노드, 이후 그냥 마스터 노드라고 함) 하나만 설치되기 때문에 사용하지 않음. 사실 kind 같은 경우 테스트에 특화 되어 있기 때문에 kind create cluster 이렇게 사용해도 무방함.