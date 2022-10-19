kubectl create ns istio-operator
kubectl create ns istio-system
kubectl create ns busola
kubectl apply -f istio-operator.yaml
kubectl wait --for condition=established --timeout=60s crd/istiooperators.install.istio.io
kubectl apply -f istio.yaml
kubectl apply -f busola.yaml