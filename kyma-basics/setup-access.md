

# Set environment variables


Execute the command:
```
kubectl proxy --address='0.0.0.0' --accept-hosts='.*'
```{{execute}}

Copy the kubeconfig for your cluster:

```
apiVersion: v1
clusters:
- cluster:
    server: https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    token: blahblah
```

Open Kyma console (busola) in the new window:
[https://busola.main.hasselhoff.shoot.canary.k8s-hana.ondemand.com/](https://busola.main.hasselhoff.shoot.canary.k8s-hana.ondemand.com/)

And paste the kubeconfig.
