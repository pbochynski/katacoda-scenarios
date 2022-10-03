
Please wait until Kubernetes cluster is ready.

Create alias `k` for `kubectl` and install autocompletion:
```
source <(kubectl completion bash)
alias k=kubectl
source <(kubectl completion bash | sed s/kubectl/k/g)
```{{exec}}

Prepare Kyma components yaml file. 
```
cat <<EOF >components.yaml
defaultNamespace: kyma-system
prerequisites:
  - name: "cluster-essentials"
components:
  - name: "serverless"
EOF
```{{exec}}

Prepare configuration:
```
cat <<EOF >values.yaml
global:
  domainName: "${{{TRAFFIC_HOST1_443}}/https:\/\//}"
serverless:
  dockerRegistry:
    enableInternal: false
    serverAddress: "${{{TRAFFIC_HOST1_5000}}/https:\/\//}"
    registryAddress: "${{{TRAFFIC_HOST1_5000}}/https:\/\//}"
    username: ""
    password: ""
EOF
```{{exec}}

Install Kyma
```
kyma deploy -p evaluation -c components.yaml -f values.yaml
```{{exec}}