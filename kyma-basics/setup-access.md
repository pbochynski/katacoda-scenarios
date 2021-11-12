Execute the command:
```
kubectl proxy --address='0.0.0.0' --accept-hosts='.*'
```{{execute}}

On your local machine create kubeconfig file `katacoda-kubeconfig.yaml` and set KUBECONFIG env variable
```
cat <<EOF >katacoda-kubeconfig.yaml
apiVersion: v1
clusters:
- cluster:
    server: https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com
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
    token: blahblah
EOF

export KUBECONFIG=$PWD/katacoda-kubeconfig.yaml
```{{copy}}

From now on you can also invoke `kubectl` commands from your local terminal.

On your local machine open Kyma Dashboard:
```
kyma dashboard
```{{copy}}