# Install istio bookinfo example

```
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
```{{execute}}

Wait for pods to be running:

```
kubectl get pods
```{{execute}}

Get ingres port:
```
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
```{{execute}}

Bookinfo URL: 
`echo http://[[HOST_SUBDOMAIN]]-$INGRESS_PORT-[[KATACODA_HOST]].environments.katacoda.com/productpage`{{execute}}

Bookinfo IP url: 
`echo http://[[HOST_IP]]:$INGRESS_PORT/productpage`{{execute}}
