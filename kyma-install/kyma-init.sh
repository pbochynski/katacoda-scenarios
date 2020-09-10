echo "Wait for Kubernetes to be ready"
launch.sh

echo "Installing helm"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# echo "Installing cert-manager"
# kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.1/cert-manager.yaml

echo "Installing istio ctl"
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.7.0 sh -
echo "Installing istio"
istio-1.7.0/bin/istioctl install --set profile=demo

echo "Download Kyma charts"
./download-kyma-charts.sh

echo "You can go to the next step"

