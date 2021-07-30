

# Install serverless

Open a new terminal. 
```
git clone https://github.com/kyma-project/kyma.git
cd kyma/tests/fast-integration/
npm install
```{{execute}}


Provide your container registry credentials as environment variables. Example for docker hub:
```
export USERNAME=kyma-rocks
export PASSWORD=admin123
export SERVER_ADDRESS=https://index.docker.io/v1/
export REGISTRY_ADDRESS=kyma-rocks
```

Create a secret for container registry credentials:
```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
 name: serverless-registry-config
 namespace: default
 labels:
   serverless.kyma-project.io/remote-registry: config
data:
 username: $(echo -n "${USERNAME}" | base64)
 password: $(echo -n "${PASSWORD}" | base64)
 serverAddress: $(echo -n "${SERVER_ADDRESS}" | base64)
 registryAddress: $(echo -n "${REGISTRY_ADDRESS}" | base64)
EOF
```{{execute}}

Install istio, api-gateway and serverless components from Kyma:
```
./kyma.js install --components istio,api-gateway,serverless --use-helm-template
```{{execute}}

Go to busola and create function with a name test. Check when the deployment is in the state ready

```
kubectl get deployment
```

Expose function on port 6000:
```
kubectl port-forward --address '0.0.0.0' svc/test 6000:80
```{{execute}}

Open [test function](https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com) in the browser.