
Go to [Busola](https://localhost:3001/cluster/kyma-katacoda/namespaces/default/functions), expand Workloads section and select Functions (if you don't see it refresh the page in the browser - you just added serverless component second ago).
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

Expose function on port 5002:
```
kubectl port-forward --address '0.0.0.0' svc/test 5002:80
```{{execute}}

Open [test function]({{TRAFFIC_HOST1_5002}}) in the browser.