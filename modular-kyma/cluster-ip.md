| WARNING: This step doesn't work, go to the next step if you are not working on the bug-fix |
|---|

Add cluster-ip to the module list in Kyma resource:

```
kubectl patch kyma default-kyma -n kyma-system --type='json' \
-p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "cluster-ip","channel":"regular" }] }]'
```{{exec}}

