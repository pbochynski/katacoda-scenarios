curl -Lo kyma https://storage.googleapis.com/kyma-cli-unstable/kyma-linux # kyma-linux, kyma-linux-arm, kyma.exe, or kyma-arm.exe
chmod +x kyma
mv kyma /usr/local/bin/
kyma alpha deploy --ci
kubectl apply -f modules.yaml
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
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
echo "Kyma Control Plane is ready. Go to next step."