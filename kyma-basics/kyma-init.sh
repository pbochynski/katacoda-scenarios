kubectl create ns istio-operator
kubectl create ns istio-system
kubectl create ns busola
kubectl apply -f istio-operator.yaml
kubectl wait --for condition=established --timeout=60s crd/istiooperators.install.istio.io
kubectl apply -f istio.yaml -n istio-system
kubectl apply -f busola.yaml -n busola
while [[ -z $(kubectl get svc -n istio-system istio-ingressgateway 2>/dev/null) ]]; do
  echo "Waiting for istio-ingressgateway"
  sleep 1
done
