#!/bin/bash

kubectl delete ServiceAccount flagger -n linkerd
kubectl delete ClusterRoleBinding flagger -n linkerd
kubectl delete ClusterRole flagger -n linkerd
kubectl delete CustomResourceDefinition canaries.flagger.app
kubectl delete CustomResourceDefinition metrictemplates.flagger.app
kubectl delete CustomResourceDefinition alertproviders.flagger.app
kubectl delete deployment flagger -n linkerd
wait
echo Uninstalled flagger

linkerd viz uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd viz

linkerd uninstall | kubectl delete -f -
echo Uninstalled linkerd CRDs