echo "Download Kyma CLI"
kubectl create ns istio-operator
kubectl create ns busola
kubectl apply -f istio.yaml
kubectl apply -f busola.yaml

