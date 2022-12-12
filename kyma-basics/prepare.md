
Copy the kubeconfig below, open [Kyma Dashboard](https://dashboard.kyma.cloud.sap/), click on *Connect cluster* button and paste the kubeconfig file. 

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



Prepare configuration:
```
export REGISTRY_URL={{TRAFFIC_HOST1_5000}}
export DOMAIN_URL={{TRAFFIC_HOST1_443}}
cat <<EOF >values.yaml
global:
  domainName: "${DOMAIN_URL/https:\/\//}"
serverless:
  dockerRegistry:
    enableInternal: false
    serverAddress: "${REGISTRY_URL/https:\/\//}"
    registryAddress: "${REGISTRY_URL/https:\/\//}"
    username: ""
    password: ""
EOF
```{{exec}}


Install Kyma
```
kyma deploy -p evaluation -c components.yaml -f values.yaml -s PR-15698 
```{{exec}}