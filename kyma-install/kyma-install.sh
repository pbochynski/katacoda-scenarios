echo "Downloading kyma charts from master"
curl https://codeload.github.com/kyma-project/kyma/zip/master --output kyma-master.zip
unzip -qq kyma-master.zip kyma-master/resources/*
rm -rf ./resources
mv kyma-master/resources .
rm -Rf ./kyma-master*

rm resources/core/charts/gateway/templates/kyma-gateway-certs.yaml
# apiserver-proxy dependencies are not required (cannot be disabled by values yet):
rm resources/apiserver-proxy/requirements.yaml
rm -R resources/apiserver-proxy/charts

# Delete ugly NOTES.txt to have cleaner output
rm resources/dex/templates/NOTES.txt 
rm resources/core/templates/NOTES.txt
rm resources/istio-kyma-patch/templates/NOTES.txt

# Delete istio deprecated resources
rm resources/dex/templates/policy.yaml 
rm resources/apiserver-proxy/templates/policy.yaml 
rm -R resources/core/charts/istio-rbac
rm resources/console/charts/backend/templates/servicerole*.yaml
rm resources/logging/templates/loki/servicerole*.yaml
rm resources/logging/charts/fluentbit/templates/policy.yaml
rm resources/logging/templates/loki/policy.yaml
rm resources/application-connector/charts/application-registry/templates/policy.yaml
rm resources/knative-eventing/charts/knative-eventing/templates/policy.yaml
rm resources/application-connector/charts/connector-service/templates/policy.yaml
rm resources/service-catalog/charts/catalog/templates/webhook-policy.yaml
rm resources/service-catalog-addons/charts/service-binding-usage-controller/templates/policy.yaml
rm resources/application-connector/charts/connector-service/templates/service-role*.yaml
rm resources/application-connector/charts/application-broker/templates/istio-rbac.yaml

echo "Installing helm"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "Creating namespaces"
kubectl create ns kyma-system
kubectl create ns kyma-integration
kubectl create ns knative-eventing
kubectl create ns natss
kubectl create ns cert-manager


echo "Installing istio ctl"
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.7.0 sh -
echo "Installing istio"
istio-1.7.0/bin/istioctl install --set profile=demo

export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export DOMAIN=[[HOST_SUBDOMAIN]]-$SECURE_INGRESS_PORT-[[KATACODA_HOST]].environments.katacoda.com
export OVERRIDES=global.isLocalEnv=false,global.ingress.domainName=$DOMAIN,global.environment.gardener=false,global.domainName=$DOMAIN,global.tlsCrt=ZHVtbXkK
export ORY=global.ory.hydra.persistence.enabled=false,global.ory.hydra.persistence.postgresql.enabled=false,hydra.hydra.autoMigrate=false

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.1/cert-manager.yaml

cat <<EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: self-issuer
  namespace: istio-system
spec:
  selfSigned: {}
EOF

cat <<EOF > certificate.tpl
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: kyma-tls-cert
  namespace: istio-system
spec:
  secretName: kyma-gateway-certs
  issuerRef:
    # The issuer created previously
    name: self-issuer
  dnsNames:
  - '*.DOMAIN'
EOF

sed "s/DOMAIN/$DOMAIN/" certificate.tpl >certificate.yaml
kubectl apply -f certificate.yaml

helm upgrade -i cluster-essentials resources/cluster-essentials -n kyma-system 
helm upgrade -i testing resources/testing -n kyma-system 
