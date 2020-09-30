Init script will install Helm 3 and Kyma CRDs.

Please wait until script is executed.

# Provide your Github Container Registry credentials

```
export REGISTRY_USER=
export REGISTRY_PASS=
```

As registry user provide your github handle, as registry pass your github token. You can get new one from 
- log in to [github].com](https://github.com)
- open Account Settings, go to Developer Security and enter Personal access tokens section
- click "Generate new token" button
- provide notes (e.g. katacoda), select write:packages scope and press "Generate token" button
- copy the access token and assign it to REGISTRY_PASS environment variable

You can delete the access token when you finish the tutorial.

# Configure serverless module

```
export DOMAIN=[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com
export SERVER_ADDRESS=ghcr.io
export REGISTRY_VALUES="dockerRegistry.username=$REGISTRY_USER,dockerRegistry.password=$REGISTRY_PASS,dockerRegistry.enableInternal=false,dockerRegistry.serverAddress=$SERVER_ADDRESS,dockerRegistry.registryAddress=$SERVER_ADDRESS/$REGISTRY_USER"       
```{{execute}}


# Install Serverless

```
helm upgrade -i serverless resources/serverless --set $REGISTRY_VALUES -n kyma-system
```{{execute}}
