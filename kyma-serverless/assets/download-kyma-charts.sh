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
rm resources/serverless/templates/destination-rule.yaml