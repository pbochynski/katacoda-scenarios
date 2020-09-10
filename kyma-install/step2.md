
# Install Kyma charts

```
helm upgrade -i core resources/core --set $OVERRIDES -n kyma-system 
helm upgrade -i api-gateway resources/api-gateway --set $OVERRIDES -n kyma-system 
helm upgrade -i ory resources/ory --set $OVERRIDES --set $ORY -n kyma-system 
```{{execute}}


# Enable http

Kyma by default redirects http to https, but in Katacoda it doesn't work with multiple hosts (subdomains) as the wildcard certificate is issued for all environments (*.environments.katacoda.com certificate doesn't work with go-hello.your-env.environments.katacoda.com) 

`kubectl patch gateway -n kyma-system kyma-gateway --type json -p '[{"op":"replace","path":"/spec/servers/1/tls/httpsRedirect","value":false}]'`{{execute}}

# Deploy example

`kubectl apply -f example.yaml`{{execute}}

Wait for go-hello pod to be ready:
`kubectl get pods`{{execute}}

Open the URL below in the browser:
`echo http://go-hello.$DOMAIN/ping`{{execute}}

