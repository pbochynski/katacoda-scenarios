
# Deploy function

```
cat <<EOF | kubectl apply -f -
apiVersion: serverless.kyma-project.io/v1alpha1
kind: Function
metadata:
  name: hello
spec:
  source: |
    module.exports = {
      main: function(event, context) {
        return 'Hello World!'
      }
    }
EOF
```{{execute}}

# Expose function on port 8080 

```
echo "Open https://$DOMAIN in your browser"
k port-forward --address 0.0.0.0 svc/hello 8080:80
```{{execute}}


