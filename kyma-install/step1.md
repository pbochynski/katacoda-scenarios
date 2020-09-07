# Configure helm

Install helm 3:
`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash`{{execute}}

Install helm-git plugin:

`export HELM_HOME=~/.helm`{{execute}}
`mkdir -p $HELM_HOME/plugins`{{execute}}
`helm plugin install https://github.com/aslafy-z/helm-git --version 0.8.1`{{execute}}

Add Kyma repo:
`helm repo add kyma git+https://github.com/pbochynski/kyma-charts@resources?ref=master`{{execute}}

# Create namespaces

```
kubectl create ns kyma-system
kubectl create ns istio-system 
kubectl create ns kyma-integration 
kubectl create ns knative-serving
kubectl create ns knative-eventing
kubectl create ns natss 
kubectl create ns kyma-installer
```{{execute}}

Label namespace:
`kubectl label ns istio-system istio-injection=disabled --overwrite`{{execute}}