# Download Kyma charts

```
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.7.0
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled
```{{execute}}

## Install bookinfo

`kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml`{{execute}}

Get services:
`kubectl get services`{{execute}}

Get pods:
`kubectl get pods`{{execute}}

Associate this application with the Istio gateway:

`kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

```
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
```{{execute}}

```
echo $INGRESS_PORT
echo $SECURE_INGRESS_PORT
```{{execute}}

Gateway URL: 
`GATEWAY_URL=[[HOST_SUBDOMAIN]]-$INGRESS_PORT-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Bookinfo app:
`echo https://"$GATEWAY_URL/productpage"`{{execute}}


## Install charts

```
helm upgrade -i cluster-essentials kyma/cluster-essentials -n kyma-system &
helm upgrade -i testing kyma/testing -n kyma-system &
helm upgrade -i dex resources/dex --set $OVERRIDES -n kyma-system 
helm upgrade -i core resources/core --set $OVERRIDES -n kyma-system 
helm upgrade -i console resources/console --set $OVERRIDES -n kyma-system 
helm upgrade -i cluster-users resources/cluster-users --set $OVERRIDES -n kyma-system 
helm upgrade -i apiserver-proxy resources/apiserver-proxy --set $OVERRIDES -n kyma-system 
helm upgrade -i api-gateway resources/api-gateway --set $OVERRIDES -n kyma-system 
```{{execute}}
