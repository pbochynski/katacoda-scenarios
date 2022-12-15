Add istio to the module list in Kyma resource:

```
kubectl patch kyma default-kyma -n kcp-system --type='json' -p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "istio","channel":"regular" }] }]'

```{{exec}}

Wait 5 seconds and check if IstioOperator resource was created:
```
kubectl get istiooperator -A
```{{exec}}