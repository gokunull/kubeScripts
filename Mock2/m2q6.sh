#!/bin/bash
# Mock 2 Question 6

k=kubectl

cat << EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john-developer
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VhbTlvYmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQU9HdkZvYjRMTG9JaGRpNlpKNG8wM1o2ZXNqR2hncXZkNXBTcDFlVDdYZGE3amhGCktKYmdJUlVLcTBvaGxiNDZ4WTVablR4SHUxc0sxNlQ0N2t3U0ErMU0rNmJhT2NmVTlOSzA0RWNTc09XcVdEaUYKejF6eWFQU3dPTVROeHRhMmtFYWx4VnViZXVUOW5iOGk2eHNnQUx3Y01heXpVTnloYzRzWThkSHdOYS9wTXQ1YwpsTEM3NTFFSC9Ya0YxemY2U3NZUGNjckRQdEN2RUg0b3BoTFBXMGQwY0tuRHFJUk1YVlU2cHZKUlI4TXRtRk1aCnZWTk9zWmFVeWRuakwyS09zdnI5ZXV3cHBKUEE1dHc3YzhvSEk3VlkxMk8vZUd2c3VhTjlIMG1scjVpUjVJRHUKWlF4Z1J2b3hSS2pJbUJGdkJNcFN1Zm1RaTJWS3VrM3NVV3h6cnpVQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRREJvY0tML0ZkaU8vVDduQ1hlaktVNHJyT3ptRWY5WUFEOHNYWUt2TjF4N29ZcHBCc1FtWWlSCkg2YnZGRHB3UU1ld3ZZQ3FBWUkvendIbDlSNkR2TUVBQjBaNmlkTTJyQ2tHZHQ4bWxIUUxmOEV3bkpYejFjTDYKNngwVmtPc1RuWDZ0d1VGZzBMR1BpR0xCWGV3NEFHRjg3a3dnRWR5L3FVVmtUbEhNMFFpSHQ3ditlajQyNWZIdApjd1JjTE1tRU0vZUZOUXlRdHRQemViWjVremVCQVNuazRibXFwQ2FqcnBaenBkMHJjMHFRVnE5UUlqaDdlSUZuCmZSYXYyRWhzWndNeVExZVoxdFZiOUZ2dDNuN3RJRGtWTUQxQmtQbnhxbkVPNzRGQ1JWdUcwNDB6ejRyQ3JHNzcKWHB5T2ptdXRNemEvT2tiMDNrWnBQTHp5R3lwbFJRaVcKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  signerName: kubernetes.io/kube-apiserver-client  
  usages:
  - digital signature
  - key encipherment
  - server auth
EOF

$k certificate approve john-developer

$k create role developer --resource=pods --verb=create,list,get,update,delete --namespace=development

$k create rolebinding developer-role-binding --role=developer --user=john-developer --namespace=development
