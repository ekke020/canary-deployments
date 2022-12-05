#!/bin/bash

for file in raw-configs/*/ ; do
  if [[ -f "${file}/kustomization.yaml" ]]; then
    kubectl kustomize $file > manifests/$(basename $file)-deployment.yaml
  fi
done