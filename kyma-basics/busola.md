```bash
export REMOTE_URL={{TRAFFIC_HOST1_80}}
export DOMAIN=${REMOTE_URL/https:\/\//}
kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: busola
spec:
  hosts:
    - $DOMAIN
  gateways:
    - kyma-system/kyma-gateway
  http:
    - name: 'backend-route'
      match:
        - uri:
            prefix: '/backend'
      route:
        - destination:
            host: backend.busola.svc.cluster.local
    - name: 'web-route'
      route:
        - destination:
            host: web.busola.svc.cluster.local
EOF
```{{exec}}