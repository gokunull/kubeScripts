#!/bin/bash
# Mock 2 Question 3

k=kubectl

cat << EOF > super-user-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: super-user-pod
spec:
  containers:
  - image: busybox:1.28
    name: super-user-pod
    command: ["sleep", "4800"]
    securityContext:
      capabilities:
        add: ["SYS_TIME"]
EOF

$k create -f super-user-pod.yaml
