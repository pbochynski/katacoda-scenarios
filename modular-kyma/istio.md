Add istio to the module list in Kyma resource:

```
kubectl patch kyma default-kyma -n kyma-system --type='json' \
-p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "istio","channel":"regular" }] }]'
```{{exec}}

Wait 5 seconds and check if IstioOperator resource was created:
```
kubectl get istiooperator -A
```{{exec}}

Check if istio is installed:
```
kubectl get pods -A
```{{exec}}

You should see something like this eventually (~20 seconds):
```
NAMESPACE      NAME                                                    READY   STATUS    RESTARTS   AGE
istio-system   istio-egressgateway-5bdd756dfd-pstmn                    1/1     Running   0          15s
istio-system   istio-ingressgateway-67f7b5f88d-8lvcj                   1/1     Running   0          15s
istio-system   istiod-58c6454c57-qw25h                                 1/1     Running   0          23s
kcp-system     istio-operator-97dcd8f98-fgd8r                          1/1     Running   0          37s
...
```
