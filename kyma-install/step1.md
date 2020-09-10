# Prerequisites

Init script will install:
- Helm 3
- Cert-manager
- Istio 1.7.0

and will download Kyma charts to resources folder.

# Create namespaces

```
kubectl create ns kyma-system
kubectl create ns kyma-integration
kubectl create ns knative-eventing
kubectl create ns natss
```{{execute}}

# Set environment variables

```
export HOST_IP=[[HOST_IP]]
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export DOMAIN=[[HOST_IP]].xip.io
export OVERRIDES=global.isLocalEnv=false,global.ingress.domainName=$DOMAIN,global.environment.gardener=false,global.domainName=$DOMAIN,global.tlsCrt=ZHVtbXkK
export ORY=global.ory.hydra.persistence.enabled=false,global.ory.hydra.persistence.postgresql.enabled=false,hydra.hydra.autoMigrate=false
```{{execute}}

# Request certificate

```
sed "s/DOMAIN/$DOMAIN/" certificate.tpl >certificate.yaml
kubectl apply -f certificate.yaml
kubectl apply -f cert-job.yaml
```{{execute}}