#!/bin/bash
# Mock 2 Question #4

k=kubectl

cat << EOF > pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  resources:
    requests:
      storage: 100Mi
EOF

$k create -f pvc.yaml

cat << EOF > /root/CKA/use-pv.yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: use-pv
  name: use-pv
spec:
  containers:
  - image: nginx
    name: use-pv
    volumeMounts:
      - mountPath: "/data"
        name: my-pvc
  volumes:
    - name: mypd
      persistentVolumeClaim:
        claimName: my-pvc
EOF

$k create -f /root/CKA/use-pv.yaml
