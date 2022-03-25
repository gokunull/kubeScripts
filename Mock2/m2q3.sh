#!/bin/bash
# Mock 2 Question 3

k=kubectl

cat << EOF | $k apply -f -
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

