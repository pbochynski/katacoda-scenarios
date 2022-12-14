Play with kyma CLI command:

```
kyma alpha deploy --ci
```{{exec}}

```sh
cat <<EOF | kubectl apply -f - 
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: module-manager-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: module-manager-manager
  namespace: kcp-system
EOF
```{{exec}}

