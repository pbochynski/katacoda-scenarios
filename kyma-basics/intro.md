Welcome to Kyma basics tutorial.

The script in the terminal window installs few Kyma modules that you will need for this tutorial. It takes about 20-30 seconds. But you can already connect to your temporary cluster with Kyma Dashboard. Copy the kubeconfig below, open [Kyma Dashboard](https://dashboard.kyma.cloud.sap/), click on *Connect cluster* button and paste the kubeconfig file. 

```
apiVersion: v1
clusters:
- cluster:
    server: {{TRAFFIC_HOST1_8001}}
  name: kyma-killercoda
contexts:
- context:
    cluster: kyma-killercoda
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    token: blahblahblah
```{{copy}}

Now check if the istio-system namespace contains istio-ingressgateway pod. If it is there and the script in the terminal is executed, you can go to the next page.