#!/bin/bash
# Mock 2 Question 2

k=kubectl

cat << EOF | $k apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: redis-storage
spec:
  containers:
  - image: redis:alpine
    name: redis
    volumeMounts:
    - mountPath: /data/redis
      name: data-redis
  volumes:
  - name: data-redis
    emptyDir: {}
EOF

 
