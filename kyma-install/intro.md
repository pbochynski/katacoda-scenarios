# Init helm

Install helm 3:
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

Install helm-git plugin:

```
export HELM_HOME=~/.helm
mkdir -p $HELM_HOME/plugins
helm plugin install https://github.com/aslafy-z/helm-git --version 0.8.1
```

Add Kyma repo:
```
helm repo add kyma git+https://github.com/pbochynski/kyma-charts@resources?ref=master
```