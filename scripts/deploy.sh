#!/bin/bash
IMAGE=$1

# Stop existing container
docker stop flask-app || true
docker rm flask-app || true

# Pull latest image
docker pull $IMAGE

# Run container
docker run -d --name flask-app -p 80:5000 $IMAGE

