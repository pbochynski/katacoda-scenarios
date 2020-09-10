echo "Wait for Kubernetes to be ready"
launch.sh

echo "Installing helm"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "Download Kyma charts"
./download-kyma-charts.sh

echo "Install CRDs"
kubectl create ns kyma-system
helm upgrade -i cluster-essentials resources/cluster-essentials -n kyma-system


