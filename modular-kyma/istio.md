Create istio module template:
```
kubectl apply -f istio-module.yaml
```{{exec}}

```
kubectl patch kyma default-kyma -n kcp-system --type='json' -p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "istio" }] }]'
```{{exec}}

