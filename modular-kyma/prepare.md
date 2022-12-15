Play with kyma CLI command:

```
kyma alpha deploy --ci
```{{exec}}

Register available Kyma modules:

```
kubectl apply -f modules.yaml
```{{exec}}

Assign cluster-admin role to module manager to be able to install any resource:

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
