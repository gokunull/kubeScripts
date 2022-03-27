#!/bin/bash
# Mock 2 Question 6

k=kubectl

$k run nginx-resolver --image=nginx 

$k expose pod nginx-resolver --name=nginx-resolver-service --port=80 --target-port=80 --type=ClusterIP

PODIP=$($k describe po nginx-resolver | grep -i -m 1 "IP:" | sed -e 's/[^0-9.]//g' | tr '.' '-' | sed 's/$/.default.pod/')

$k run test-nslookup --image=busybox:1.28 -it -- nslookup nginx-resolver-service > /root/nginx.svc

$k run test-nslookup-pod --image=busybox:1.28 -it -- nslookup $PODIP > /root/nginx.pod
