
# Install charts

```
helm upgrade -i dex resources/dex --set $OVERRIDES -n kyma-system 
helm upgrade -i core resources/core --set $OVERRIDES -n kyma-system 
helm upgrade -i console resources/console --set $OVERRIDES -n kyma-system 
helm upgrade -i cluster-users resources/cluster-users --set $OVERRIDES -n kyma-system 
helm upgrade -i apiserver-proxy resources/apiserver-proxy --set $OVERRIDES -n kyma-system 
helm upgrade -i api-gateway resources/api-gateway --set $OVERRIDES -n kyma-system 
```{{execute}}
