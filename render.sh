#!/bin/bash

for f in deployments/*/ ; do
  namespace=$(grep -hnr "namespace" ${f}kustomization.yaml)
  if [[ ! -d "clusters/deep/namespace/${namespace##* }" ]]; then
    mkdir clusters/flagger/${namespace##* }
    echo "Created folder for namespace: ${namespace##* }"
  fi
  rm -f clusters/flagger/${namespace##* }/* 
  kubectl kustomize $f > clusters/flagger/${namespace##* }/deployment.yaml
  echo $f
done