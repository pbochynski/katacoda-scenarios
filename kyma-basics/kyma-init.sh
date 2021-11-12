echo "Download Kyma CLI"
curl -Lo kyma https://storage.googleapis.com/kyma-cli-stable/kyma-linux
chmod +x kyma
mv kyma /usr/local/bin

echo "Start local docker registry"
docker run -d \
-p 5000:5000 \
--restart=always \
--name registry.localhost \
-v $PWD/registry:/var/lib/registry \
eu.gcr.io/kyma-project/test-infra/docker-registry-2:20200202

echo "Wait for Kubernetes to be ready"
launch.sh




