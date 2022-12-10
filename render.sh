#!/bin/bash

for f in raw-configs/*/ ; do
  namespace=$(grep -hnr "namespace" ${f}kustomization.yaml)
  if [[ ! -d "clusters/deep/namespace/${namespace##* }" ]]; then
    mkdir clusters/deep/namespace/${namespace##* }
    echo "Created folder for namespace: ${namespace##* }"
  fi
  rm -f clusters/deep/namespace/${namespace##* }/* 
  kubectl kustomize $f > clusters/deep/namespace/${namespace##* }/deployment.yaml
done