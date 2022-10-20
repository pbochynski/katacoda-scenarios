SECONDS=0
kubectl proxy --address='0.0.0.0' --accept-hosts='.*' -p 8001 &
kubectl create ns istio-operator
kubectl create ns istio-system
kubectl create ns kyma-system
kubectl apply -f istio-operator.yaml
kubectl wait --for condition=established --timeout=60s crd/istiooperators.install.istio.io
kubectl apply -f istio.yaml -n istio-system
while [[ $(kubectl get pods -n istio-system -l app=istio-ingressgateway -o jsonpath='{..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
  echo "Waiting for istio-ingressgateway (usually about 20-30s)"
  sleep 3
done
kubectl apply -f kyma-gateway.yaml -n kyma-system
kubectl port-forward --address=0.0.0.0 -n istio-system svc/istio-ingressgateway 5000:80 &
echo "Kyma modules started in $SECONDS seconds"