#!/bin/bash

kubectl delete -f ./platform/flagger/kustomization.yaml

linkerd viz uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd viz

linkerd uninstall | kubectl delete -f -
echo Uninstalled linkerd CRDs