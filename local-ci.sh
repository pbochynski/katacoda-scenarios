k3d cluster create test
k3d kubeconfig get test >kubeconfig
export REGISTRY_USER=
export REGISTRY_PASS=
act -P ubuntu-latest=nektos/act-environments-ubuntu:18.04 -s REGISTRY_USER -s REGISTRY_PASS
k3d cluster delete test