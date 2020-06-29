#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=rshukl4/flasksklearn

# Step 2
# Run the Docker Hub container with kubernetes
#kubectl run flaskapp --image=rshukl4/flasksklearn --port=80
kubectl run flaskapplication\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flaskapplication
# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
echo "While waiting for pod to come up sleeping for 10 seconds"
sleep 10
kubectl port-forward flaskapplication 8000:80
kubectl logs --selector app=flaskapplication
