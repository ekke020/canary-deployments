#!/bin/bash

if [[ "$1" == "1" ]]; then
  watch flux get kustomizations
elif [[ "$1" == "2" ]]; then
  watch kubectl get pods --all-namespaces --field-selector metadata.namespace!=kube-system
elif [[ "$1" == "3" ]]; then
  watch kubectl -n backend get canary
elif [[ "$1" == "4" ]]; then
  kubectl port-forward svc/frontend-srv 7878:80 -n frontend
fi