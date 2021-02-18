#!/bin/sh

# array syntax is not used here because /bin/sh doesn't support it
repos="
    cluster-providers
    kube-integration
    accounts-referrals
    charts-manager
    mailer
    payments
    cfsign
    segment-reporter
    salesforce-reporter
    tasker-kubernetes
    context-manager
    pipeline-manager
    cfapi
    cfui
    onboarding-status
    runtime-environment-manager
    cf-broadcaster
    helm-repo-manager
    hermes
    nomios
    cronus
"
for r in $repos; do
    helm repo add $r http://chartmuseum.codefresh.io/$r
    helm repo add $r-dev http://chartmuseum-dev.codefresh.io/$r
done