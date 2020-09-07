# Create namespaces

```
kubectl create ns kyma-system
kubectl create ns istio-system
kubectl create ns kyma-integration
kubectl create ns knative-serving
kubectl create ns knative-eventing
kubectl create ns natss
kubectl create ns kyma-installer


kubectl label ns istio-system istio-injection=disabled --overwrite
```