echo "Download Kyma CLI"

curl -Lo kyma https://storage.googleapis.com/kyma-cli-stable/kyma-linux
chmod +x kyma
mv kyma /usr/local/bin


echo "Wait for Kubernetes to be ready"
launch.sh




