
# Create namespaces

```
kubectl create ns kyma-system
kubectl create ns kyma-integration
kubectl create ns knative-eventing
kubectl create ns natss
kubectl label namespace default istio-injection=enabled --overwrite
kubectl label namespace kyma-system istio-injection=enabled --overwrite
kubectl label namespace kyma-integration istio-injection=enabled --overwrite
```{{execute}}

# Set environment variables

```
export HOST_IP=[[HOST_IP]]
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export DOMAIN=[[HOST_SUBDOMAIN]]-$INGRESS_PORT-[[KATACODA_HOST]].environments.katacoda.com
export OVERRIDES=global.isLocalEnv=false,global.ingress.domainName=$DOMAIN,global.environment.gardener=false,global.domainName=$DOMAIN,global.tlsCrt=ZHVtbXkK
export ORY=global.ory.hydra.persistence.enabled=false,global.ory.hydra.persistence.postgresql.enabled=false,hydra.hydra.autoMigrate=false
```{{execute}}

# Install CRDs

```
helm upgrade -i cluster-essentials resources/cluster-essentials -n kyma-system
helm upgrade -i testing resources/testing -n kyma-system
```{{execute}}
