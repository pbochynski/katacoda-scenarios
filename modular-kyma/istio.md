Add istio to the module list in Kyma resource:

```
kubectl patch kyma default-kyma -n kcp-system --type='json' -p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "istio" }] }]'
```{{exec}}

