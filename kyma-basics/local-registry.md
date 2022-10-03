Prepare local docker registry:

```bash
export REMOTE_URL={{TRAFFIC_HOST1_5000}}
export REMOTE_HOST=${REMOTE_URL/https:\/\//}
echo "Start local docker registry"
docker run -d \
-p 5000:5000 \
--restart=always \
-v $PWD/registry:/var/lib/registry \
registry:2
```{{exec}}

Push to remote registry through killercoda reverse proxy will fail with `413 Request Entity Too Large` error:
```bash
docker pull nginx:alpine
docker tag nginx:alpine $REMOTE_HOST/nginx:alpine
docker push $REMOTE_HOST/nginx:alpine
```{{exec}}

Push to local registry directly works:
```bash
docker pull nginx:alpine
docker tag nginx:alpine 127.0.0.1:5000/nginx:alpine
docker push 127.0.0.1:5000/nginx:alpine
```{{exec}}

Now you can push again with remote host and it will work because registry already has all the layers and nothing is transferred.