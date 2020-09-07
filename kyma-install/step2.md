# Install charts

```
helm upgrade -i cluster-essentials kyma/cluster-essentials -n kyma-system &
helm upgrade -i testing kyma/testing -n kyma-system &
helm upgrade -i istio kyma/istio -n istio-system &
```{{execute}}
