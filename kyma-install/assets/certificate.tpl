apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: self-issuer
  namespace: istio-system
spec:
  selfSigned: {}
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: kyma-tls-cert
  namespace: istio-system
spec:
  secretName: kyma-gateway-certs
  issuerRef:
    # The issuer created previously
    name: self-issuer
  dnsNames:
  - '*.DOMAIN'
