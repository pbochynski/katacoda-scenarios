# Interactive Katacoda Scenarios

[![](http://shields.katacoda.com/katacoda/pbochynski/count.svg)](https://www.katacoda.com/pbochynski "Get your profile on Katacoda.com")
![Tests on k3s](https://github.com/pbochynski/katacoda-scenarios/workflows/Tests%20on%20k3s/badge.svg)

Visit https://www.katacoda.com/pbochynski to view the profile and interactive scenarios

### Writing Scenarios
Visit https://www.katacoda.com/docs to learn more about creating Katacoda scenarios

For examples, visit https://github.com/katacoda/scenario-example


# Testing locally

You can run the Github Action workflow locally with Act. If you are working on Linux machine you can use workflow as it is. If you are running on Mac or Windows you need to start local kubernetes cluster and copy the kubeconfig to the root folder. The workflow for serverless requires credentials to github docker registry: REGISTRY_USER and REGISTRY_PASS (your github user and personal web token you can get from your github account developer settings). This is sample script to run CI workflow locally:

```
k3d cluster create test
k3d kubeconfig get test >kubeconfig
export REGISTRY_USER=your_github_user
export REGISTRY_PASS=your_personal_web_token
act -P ubuntu-latest=nektos/act-environments-ubuntu:18.04 -s REGISTRY_USER -s REGISTRY_PASS
k3d cluster delete test
```