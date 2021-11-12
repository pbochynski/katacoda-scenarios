
Please wait until Kubernetes cluster is ready.

Create alias `k` for `kubectl` and install autocompletion:
```
source <(kubectl completion bash)
alias k=kubectl
source <(kubectl completion bash | sed s/kubectl/k/g)
```{{execute}}

Prepare Kyma components yaml file
```
cat <<EOF >components.yaml
defaultNamespace: kyma-system
prerequisites:
  - name: "cluster-essentials"
  - name: "istio-configuration"
    namespace: "istio-system"
components:
  - name: "serverless"
EOF
```{{execute}}

Prepare configuration:
```
cat <<EOF >values.yaml
global:
  domainName: [[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com
serverless:
  dockerRegistry:
    enableInternal: false
    serverAddress: https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com
    registryAddress: https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com
EOF
```{{execute}}

Install Kyma
```
kyma deploy -p evaluation -c components.yaml -f values.yaml
```{{execute}}