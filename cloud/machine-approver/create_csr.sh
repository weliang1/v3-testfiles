#!/bin/bash

# Create CSR
for i in `seq 1 100`
do
oc create -f -<<EOF
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: csr-test-`uuidgen | cut -d '-' -f 1`
spec:
  groups:
  - system:nodes
  - system:authenticated
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQlFUQ0I2QUlCQURCSU1SVXdFd1lEVlFRS0V3eHplWE4wWlcwNmJtOWtaWE14THpBdEJnTlZCQU1USm5ONQpjM1JsYlRwdWIyUmxPbkZsTFdwb2IzVXRZMnRuTlhNdGQyOXlhMlZ5TFRZNGNtTjJNRmt3RXdZSEtvWkl6ajBDCkFRWUlLb1pJemowREFRY0RRZ0FFOHltQ3R0UmhUNGYwM2ZCMVhzZFNsVGtOeTlEZ2lTTERPNFQ4MkxRUU80OWgKdnkxaGpDelAwRXhmVG5PQytEYmw4ZWRjK2RMcVlMRmRHQ1VxMXBsRjM2QStNRHdHQ1NxR1NJYjNEUUVKRGpFdgpNQzB3S3dZRFZSMFJCQ1F3SW9JYWNXVXRhbWh2ZFMxamEyYzFjeTEzYjNKclpYSXROamh5WTNhSEJNQ29BQmN3CkNnWUlLb1pJemowRUF3SURTQUF3UlFJaEFKYy81Y1ZEdzQ5bGl0bWQyUDZJdGdPL0VtZ1Q4NVN4SDJtUTNrc1QKQzVGVEFpQm5XZVRWRWdxbjZwZE5KcU5HVEo0dEZNNjZOUllHZzI5Y01PK0IvS0NtRVE9PQotLS0tLUVORCBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0K
  usages:
  - digital signature
  - key encipherment
  - server auth
  username: system:node:qe-jhou-ckg5s-worker-68rcv-xxx
EOF
done
