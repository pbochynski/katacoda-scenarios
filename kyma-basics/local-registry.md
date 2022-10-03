Prepare local docker registry:

```
export REMOTE_URL={{TRAFFIC_HOST1_5000}}
export REMOTE_HOST=${REMOTE_URL/https:\/\//}
echo "Start local docker registry"
docker run -d \
-p 5000:5000 \
--restart=always \
-v $PWD/registry:/var/lib/registry \
registry:2
```{{exec}}

Push to local registry:
```
docker pull nginx:alpine
docker tag nginx:alpine 127.0.0.1:5000/nginx:alpine
docker push 127.0.0.1:5000/nginx:alpine
```{{exec}}

Push to remote registry (through killercoda reverse proxy):

```
docker pull nginx:alpine
docker tag nginx:alpine $REMOTE_HOST/nginx:alpine
docker push $REMOTE_HOST/nginx:alpine
```{{exec}}


