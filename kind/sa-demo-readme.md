### 사용 명령어

```
# 클러스터 만들기
kind create cluster --name sa-demo

# 차례대로 실행시키기
# 1.namespace

kubectl apply -f sa-demo-namespace.yaml
# 1.1 namespae 생성 확인 
kubectl get ns 
# 또는 kubectl get namespace

# 2.ServiceAccount 
kubectl apply -f sa-demo-sa.yaml
# 2.1 sa 생성 확인
kubectl get sa -n sa-demo 
# 또는 kubectl get sa -A

# 3.Role
kubectl apply -f sa-demo-role.yaml
# 3.1 role 생성 확인
kubectl get role -n sa-demo

# 4.Rolebinding
kubectl apply -f sa-demo-rolebinding.yaml
# 4.1 rolebinding 생성 확인
kubectl get rolebinding -n sa-demo

# 5.test pod 실행
kubectl apply -f sa-demo-pod.yaml

# 5.1 sa-test 동작 확인
kubectl get pod sa-test -n sa-demo

# 5.2 로그로 인증·RBAC 동작 확인
kubectl logs sa-test -n sa-demo

# Mounted Token 아래로 JWT 토큰이 출력되고, API Call 부분에서 pods 리스트가 JSON 형태로 반환되면 성공
```