You can now enable that module in the Kyma Dashboard. Go to the namespace kyma-system, open Kyma resource (in the Kyma section), edit it and add `keda` or `cluster-ip` module from beta channel. 

If you prefer CLI you can enable Keda using this command:
```
kubectl patch kyma default-kyma -n kyma-system --type='json' -p='[{"op": "add", "path": "/spec/modules/-", "value": {"name": "keda", "channel": "beta" } }]'
```{{exec}}

and `cluster-ip` module using this command:
```
kubectl patch kyma default-kyma -n kyma-system --type='json' -p='[{"op": "add", "path": "/spec/modules/-", "value": {"name": "cluster-ip", "channel": "beta" } }]'
```{{exec}}

Now you can verify if cluster IP is already available:
```
kubectl get clusterip -n kyma-system clusterip-nodes -oyaml
```{{exec}}