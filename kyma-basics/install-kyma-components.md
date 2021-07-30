Before you create your first function you need to configure your container registry.

Provide your container registry credentials as environment variables like in this example:
```
export USERNAME=kyma-rocks
export PASSWORD=admin123
export SERVER_ADDRESS=https://index.docker.io/v1/
export REGISTRY_ADDRESS=kyma-rocks
```

Generate doocker config json (base64 encoded):
```
export DOCKERCONFIGJSON=$(kubectl create secret docker-registry tmp \
--docker-server=${SERVER_ADDRESS} --docker-username=${USERNAME} \
--docker-password=${PASSWORD} --dry-run=client -o jsonpath='{.data.\.dockerconfigjson}')
```{{execute}}

Create a secret for container registry credentials:
```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
type: kubernetes.io/dockerconfigjson
metadata:
 name: serverless-registry-config
 namespace: default
 labels:
   serverless.kyma-project.io/remote-registry: config
data: 
 .dockerconfigjson: ${DOCKERCONFIGJSON}
 username: $(echo -n "${USERNAME}" | base64)
 password: $(echo -n "${PASSWORD}" | base64)
 serverAddress: $(echo -n "${SERVER_ADDRESS}" | base64)
 registryAddress: $(echo -n "${REGISTRY_ADDRESS}" | base64)
EOF
```{{execute}}

# Create serverless function

Go to [Busola](https://dashboard.dev.kyma.cloud.sap/cluster/kyma-katacoda/namespaces/default/functions), expand Workloads section and select Functions (if you don't see it refresh the page in the browser - you just added serverless component second ago).
Now create a new function with a name `test`. 
If you don't want to use UI you can create function with kubectl:
```
cat <<EOF | kubectl apply -f -
apiVersion: serverless.kyma-project.io/v1alpha1
kind: Function
metadata:
  name: test
spec:
  buildResources:
    limits:
      cpu: 700m
      memory: 700Mi
    requests:
      cpu: 200m
      memory: 200Mi
  deps: |-
    { 
      "name": "test",
      "version": "1.0.0",
      "dependencies": {}
    }
  maxReplicas: 1
  minReplicas: 1
  resources:
    limits:
      cpu: 25m
      memory: 32Mi
    requests:
      cpu: 10m
      memory: 16Mi
  runtime: nodejs14
  source: |-
    module.exports = { 
      main: function (event, context) {
        return "Hello World!";
      }
    }
EOF
```{{execute}}

Wait until the function status will become green (deployed). You can also watch the pods and deployments to track the progress of function build and deploy process:
```
kubectl get pods
kubectl get deployments
```{{execute}}

Expose function on port 6000:
```
kubectl port-forward --address '0.0.0.0' svc/test 6000:80
```{{execute}}

Open [test function](https://[[HOST_SUBDOMAIN]]-6000-[[KATACODA_HOST]].environments.katacoda.com) in the browser.