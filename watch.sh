#!/bin/bash

watch 'kubectl get pods --all-namespaces --field-selector metadata.namespace!=kube-system'