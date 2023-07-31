echo "---------------------------------------------"
echo "----------------- A R G O -------------------"
echo "---------------------------------------------"
echo "ARGO namespace를 생성합니다."
kubectl config set-context --current --namespace=argocd

echo "---------------------------------------------"
echo "ARGO install 스크립트를 실행합니다."
kubectl apply -f install.yaml

echo "---------------------------------------------"
echo "ARGO admin 패스워드를 설정합니다.."
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$utN6endGj9/hmyvExPEj1eliEGzMKmcHd.OOfi0dgSZvPrpk5Pq5W",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

echo "---------------------------------------------"
#echo "ARGO ingress를 적용합니다."
# kubectl apply -f ingress.yaml


