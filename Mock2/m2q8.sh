#!/bin/bash
# Mock 2 Question 8

cat << EOF > ~/nginx-critical.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-critical
spec:
  containers:
  - name: nginx-critical
    image: nginx
EOF

ssh node01 | scp controlplane:~/nginx-critical.yaml /etc/kubernetes/manifests/
