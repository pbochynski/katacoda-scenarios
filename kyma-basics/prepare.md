
Please wait until you see the message **Kyma installed** in the terminal.

Create alias `k` for `kubectl` and install autocompletion:
```
source <(kubectl completion bash)
alias k=kubectl
source <(kubectl completion bash | sed s/kubectl/k/g)
```{{execute}}