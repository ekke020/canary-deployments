#!/bin/bash

linkerd viz uninstall | kubectl delete -f -
wait
echo Uninstalled linkerd viz

linkerd uninstall | kubectl delete -f -
echo Uninstalled linkerd CRDs