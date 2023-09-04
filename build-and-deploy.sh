#!/bin/bash

# Build Docker image
docker build -t wusi24/node-web-server:1.0 .

# Push the image to Dockerhub
docker push wusi24/node-web-server:1.0

# Set up minikube context
minikube start

# Apply Kubernetes manifests
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml

# Get the minikube IP
minikube_ip=$(minikube ip)

# Output the URL to access the web server
echo "Web server URL: http://bar.local/foo"

# Wait for the web server to become available (optional)
sleep 5

# Test access to the web server using curl
curl http://bar.local/foo

