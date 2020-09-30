
# Deploy function

`kubectl apply -f function.yaml`{{execute}}

# Wait until funtion is deployed

You should see hello-build pod created in default namespace - it builds a docker container with your function. When it is completed the new pod hello containing the function. Check the pods: 

`kubectl get pods`{{execute}}

Repeat the command until you see hello pod in running state.


# Expose function on port 8080 

The script will print the external URL of your katacoda environment and will establish port forward to hello service. When you open URL in your browser you should see "Hello World!" message.

```
echo "Open https://$DOMAIN in your browser"
kubectl port-forward --address 0.0.0.0 svc/hello 8080:80
```{{execute}}
