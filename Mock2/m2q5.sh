#!/bin/bash
# Mock 2 Question 5

k=kubectl

$k run nginx-deploy --image=nginx:1.16 --replicas=1 --record=true

sleep 10

$k set image deployment nginx-deploy nginx=nginx:1.17 --record=true

$k rollout history deployment nginx-deploy
