|WARNING: Kyma module doesn't work yet - there are some not resolved issues, skip to the next step|
|---|

Download the latest Kyma CLI:
```
curl -Lo kyma https://storage.googleapis.com/kyma-cli-unstable/kyma-linux # kyma-darwin, kyma-linux-arm, kyma.exe, or kyma-arm.exe
chmod +x kyma
mv kyma /usr/local/bin
```{{exec}}

Install Kyma lifecycle-manager:
```
kyma alpha deploy --ci
```{{exec}}

Assign cluster-admin role to lifecycle manager to be able to install any resource:
```
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
  name: lifecycle-manager-controller-manager
  namespace: kcp-system
EOF
```{{exec}}

Install module template:
```
kubectl apply -f https://raw.githubusercontent.com/pbochynski/cluster-ip/main/cluster-ip-module-template.yaml
```{{exec}}

Enable module in Kyma CR:
```
kubectl patch kyma default-kyma -n kyma-system --type='json' \
-p='[{"op": "add", "path": "/spec/modules", "value": [{"name": "cluster-ip","channel":"regular" }] }]'
```{{exec}}

Check installation status:
```
 kubectl get manifest -n kyma-system -oyaml
```{{exec}}