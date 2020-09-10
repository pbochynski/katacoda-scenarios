# Provide your docker.io credentials

```
export USERNAME=
export EMAIL=
export PASSWORD=
```

# Configure serverless module

```
export DOMAIN=[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com
export SERVER_ADDRESS=https://index.docker.io/v1/
export REGISTRY_ADDRESS=$USERNAME
export REGISTRY_VALUES="dockerRegistry.username=$USERNAME,deckerRegistry.password=$PASSWORD,dockerRegistry.enableInternal=false,dockerRegistry.serverAddress=$SERVER_ADDRESS,dockerRegistry.registryAddress=$REGISTRY_ADDRESS"
```{{execute}}


# Install Serverless

```
helm upgrade -i serverless resources/serverless --set $REGISTRY_VALUES -n kyma-system
```{{execute}}

# Patch serverless secrets due to bug in helm chart

```
kubectl delete secret serverless-image-pull-secret
kubectl create secret docker-registry serverless-image-pull-secret --docker-server=$SERVER_ADDRESS --docker-username=$USERNAME --docker-password=$PASSWORD --docker-email=$EMAIL
kubectl delete secret serverless-image-pull-secret -n kyma-system
kubectl create secret docker-registry serverless-image-pull-secret -n kyma-system --docker-server=$SERVER_ADDRESS --docker-username=$USERNAME --docker-password=$PASSWORD --docker-email=$EMAIL
kubectl delete pod -n kyma-system -l app=serverless
```{{execute}}