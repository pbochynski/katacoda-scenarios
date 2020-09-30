
echo "Installing helm"
curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "Downloading kyma charts from master"
curl -s https://codeload.github.com/kyma-project/kyma/zip/master --output kyma-master.zip
unzip -qq kyma-master.zip kyma-master/resources/*
rm -rf ./resources
mv kyma-master/resources .
rm -Rf ./kyma-master*
rm resources/serverless/templates/destination-rule.yaml

echo "Install CRDs"
kubectl create ns kyma-system
kubectl apply -f resources/cluster-essentials/files


