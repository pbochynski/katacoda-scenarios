RUNNING=""
SECONDS=0
while [[ $RUNNING != "True" && SECONDS<60]]; do RUNNING=$(kubectl get function hello -ojsonpath='{.status.conditions[?(@.type=="Running")].status}'); echo "waiting for function hello, pods:\n$(kubectl get pods)"; sleep 2; done
kubectl logs -l serverless.kyma-project.io/function-name=hello
kubectl port-forward --address 0.0.0.0 svc/hello 8080:80 &
MSG=""
while [[ "$MSG" != "Hello World!" ]]; do MSG=$(curl -s -m 5 http://localhost:8080); echo "MSG from service: $MSG"; sleep 2; done
