

```bash
export REMOTE_URL={{TRAFFIC_HOST1_5000}}
export DOMAIN=${REMOTE_URL/https:\/\//}
kubectl apply -f - <<EOF
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: busola-gateway
spec:
  selector:
    istio: ingressgateway # use istio default controller
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "*"
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: busola
spec:
  hosts:
    - $DOMAIN
  gateways:
    - busola-gateway
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

```
kubectl port-forward --address=0.0.0.0 -n istio-system svc/istio-ingressgateway 5000:80
```{{exec}}

Open this link: [{{TRAFFIC_HOST1_5000}}]({{TRAFFIC_HOST1_5000}}) 