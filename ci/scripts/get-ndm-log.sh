#!/bin/bash -e

TARGETNODE="node1"

export KUBECONFIG=kubeconfig

NDMPOD=$(kubectl get pods -n harvester-system --field-selector spec.nodeName=$TARGETNODE |grep ^harvester-node-disk-manager |awk '{print $1}')

# filter out the redundant Skip log
kubectl logs $NDMPOD -n harvester-system |grep -v Skip