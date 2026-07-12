#!/bin/bash

CLUSTER=$1
RG=$2

az aks get-credentials \
  --name $CLUSTER \
  --resource-group $RG \
  --overwrite-existing

helm repo add csi-secrets-store-provider-azure https://azure.github.io/secrets-store-csi-driver-provider-azure/charts

helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts

helm repo update

helm install csi csi-secrets-store-provider-azure/csi-secrets-store-provider-azure

helm install gatekeeper gatekeeper/gatekeeper \
  --namespace gatekeeper-system \
  --create-namespace

kubectl apply -f policies/gatekeeper/

kubectl apply -f k8s/base/network-policies.yaml