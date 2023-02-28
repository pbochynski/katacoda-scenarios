You can connect to this cluster from Kyma Dashboard. You just need to open 
open proxy to the kubernetes API server:
```
kubectl proxy --address='0.0.0.0' --accept-hosts='.*' &
```{{execute}}

Copy the kubeconfig:
```
apiVersion: v1
clusters:
- cluster:
    server: {{TRAFFIC_HOST1_8001}}
  name: kyma-katacoda
contexts:
- context:
    cluster: kyma-katacoda
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    token: tokentokentoken
```{{copy}}

Paste it in the [Kyma Dashboard](https://dashboard.kyma.cloud.sap) (Connect cluster button)