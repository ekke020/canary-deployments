#!/bin/bash

kustomize build raw-configs/canary-frontend | kubectl delete -f -
wait
echo Uninstalled the frontend

kustomize build raw-configs/canary-backend | kubectl delete -f -
wait
echo Uninstalled the backend

kubectl delete ServiceAccount flagger -n linkerd
kubectl delete ClusterRoleBinding flagger -n linkerd
kubectl delete ClusterRole flagger -n linkerd
kubectl delete CustomResourceDefinition canaries.flagger.app
kubectl delete CustomResourceDefinition metrictemplates.flagger.app
kubectl delete CustomResourceDefinition alertproviders.flagger.app
kubectl delete deployment flagger -n linkerd
wait
echo Uninstalled flagger

linkerd smi uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd smi

linkerd viz uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd viz

linkerd uninstall | kubectl delete -f -
echo Uninstalled linkerd CRDs