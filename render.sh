#!/bin/bash

for f in raw-configs/*/ ; do
  namespace=$(grep -hnr "namespace: " ${f} | head -1)
  if [[ ! -d "clusters/linkerd-canary/namespace/${namespace##* }" ]]; then
    mkdir -p clusters/linkerd-canary/namespace/${namespace##* }
    echo "Created folder for namespace: ${namespace##* }"
  fi
  rm -f clusters/linkerd-canary/namespace/${namespace##* }/* 
  kubectl kustomize $f > clusters/linkerd-canary/namespace/${namespace##* }/deployment.yaml
done
