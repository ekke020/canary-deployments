#!/bin/bash

for file in raw-configs/*/ ; do
  echo $(basename $file)
  kubectl kustomize $file > manifests/$(basename $file)-deployment.yaml
done