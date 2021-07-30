

# Deploy hello world container

In busola:
- go to default namespace
- click deploy new workload -> create deployment
- provide a name `hello` and the image `paulbouwer/hello-kubernetes:1.10`
- click `Create`


Open new terminal tab and check if there is a deployment and service created
```
kubectl get deployments
kubectl get svc
```
If you see the service hello execute this command to expose it:

```
kubectl port-forward --address='0.0.0.0' svc/hello 5000:80
```{{execute}}

Open the hello world application:
[https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com](https://[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com])

