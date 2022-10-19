
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