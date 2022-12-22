#!/bin/bash

# kustomize build raw-configs/canary-frontend | kubectl delete -f -
# wait
# echo Uninstalled the frontend

# kustomize build raw-configs/canary-backend | kubectl delete -f -
# wait
# echo Uninstalled the backend

kustomize build platform/flagger/ | kubectl delete -f -
wait
echo Uninstalled flagger

kustomize build platform/linkerd/smi | kubectl delete -f -
wait
echo Uninstalled linkerd smi

linkerd viz uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd viz

linkerd uninstall | kubectl delete -f -
echo Uninstalled linkerd CRDs