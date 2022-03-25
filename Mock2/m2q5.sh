#!/bin/bash
# Mock 2 Question 5

k=kubectl

cat << EOF | $k apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.16
EOF

sleep 10

$k set image deployment nginx-deploy nginx=nginx:1.17 --record=true

$k rollout history deployment nginx-deploy
