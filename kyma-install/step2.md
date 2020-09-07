# Install istio

```
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.7.0
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled
```{{execute}}

# Install charts

```
helm upgrade -i cluster-essentials kyma/cluster-essentials -n kyma-system &
helm upgrade -i testing kyma/testing -n kyma-system &
```{{execute}}
