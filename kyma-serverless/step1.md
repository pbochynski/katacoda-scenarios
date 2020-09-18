# Provide your docker.io credentials

```
export USERNAME=
export PASSWORD=
```

You can use access key instead of password. You can get it in few simple steps:
- log in to [hub.docker.com](https://hub.docker.com)
- open Account Settings and enter Security section
- click "New Access Token" button
- provide description (e.g. katacoda) and press "Create"
- copy the access token and assign it to PASSWORD environment variable

You can delete the access token when you finish the tutorial.

# Configure serverless module

```
export DOMAIN=[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com
export SERVER_ADDRESS=https://index.docker.io/v1/
export REGISTRY_ADDRESS=$USERNAME
export REGISTRY_VALUES="dockerRegistry.username=$USERNAME,dockerRegistry.password=$PASSWORD,dockerRegistry.enableInternal=false,dockerRegistry.serverAddress=$SERVER_ADDRESS,dockerRegistry.registryAddress=$REGISTRY_ADDRESS"
```{{execute}}


# Install Serverless

```
helm upgrade -i serverless resources/serverless --set $REGISTRY_VALUES -n kyma-system
```{{execute}}
