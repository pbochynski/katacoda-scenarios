
echo "Clone Kyma repository"
git clone https://github.com/kyma-project/kyma.git

echo "Build kyma.js utility"
cd kyma/tests/fast-integration/
npm install

echo "Wait for Kubernetes to be ready"
launch.sh

echo "Install Kyma components"
export DEBUG=true
./kyma.js install --components serverless --skip-componenents istio --use-helm-template



