Open new terminal tab.

Create keda module template:
```
kubectl apply -f keda-module.yaml
```{{exec}}

You can now enable that module in the Kyma Dashboard. Go to the namespace kcp-system, open Kyma resource (in the Kyma section), edit it and add Keda module. 

If you prefer CLI you can enable Keda using this command:
```
kubectl patch kyma default-kyma -n kcp-system --type='json' -p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "keda" }] }]'
```{{exec}}

