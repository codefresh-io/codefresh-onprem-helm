# Helm for Codefresh

[![Codefresh Helm Release Status]( https://g.codefresh.io/api/badges/release?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NTY3MmQ4ZGViNjcyNGI2ZTM1OWFkZjYy.AN2wExsAsq7FseTbVxxWls8muNx_bBUnQWQVS8IgDTI&selector=cf-prod@codefresh-production&name=production&tillerNamespace=kube-system)]( https://g.codefresh.io/helm/releases/cf-prod@codefresh-production/kube-system/production/services)


### Updaing microservice version:
Edit `codefresh/env/<environment>/versions.yaml`
For example, to change api version to v399 on production open `codefresh/env/production/versions.yaml`
and set `cfapi.imageTag: v399`
```
git commit -am "cfapi updated to ..."
git push
```
Than go to Codefresh and launch appropriative cf-helm pipeline
For production it is configured to start automatically by webhook

### Updaing microservice non-secret parameters:
Edit `codefresh/env/<environment>/values.yaml`
```
git commit -am "cfapi updated to ..."
git push
```
Than go to Codefresh and launch appropriative cf-helm pipeline
For production it is configured to start automatically by webhook

### Updating secret values
All secret values for helm are stored in file ç encrypted with sops - https://github.com/mozilla/sops  

* Install sops from https://github.com/mozilla/sops/releases (or using brew)
* setup aws credentials file ( ~/.aws/credentials )
```
git pull
./sops.sh -d [folder with values-enc.yaml, default ./ ]
```
It will decrypt all values-enc.yaml to values-dec.yaml
* edit values-dec.yaml
* run `./sops.sh -e [folder with values-enc.yaml, default ./ ]`
  It will encrypt all values-dec.yaml to values-enc.yaml
* commit and push
  `git commit -am "secrets for production changed" && git push`

### Updating existing chart template
* edit template. Follow general helm pattern to separate k8s definitions from environemnt specific values. 
* update version in Chart.yaml
* update version of edited chart in requirements.yaml (if it appears there)
`git commit -am "chart main-service changed" && git push`
* run cf-helm pipeline to apply changes
  
### Adding new helm chart for a microservice
We recommend to add a new chart using our cf-helm-starter boilerplate: 
https://github.com/codefresh-io/cf-helm-starter  
  
### Dev environment setup
Recommended way is to use cf-helm Codefresh pipeline - see codefresh yamls in pipeline/ and Dockerfile

If you prefer to debug helm charts locally install helm, sops, kubectl 
* Install helm by `brew install kubernetes-helm` - see https://github.com/kubernetes/helm/blob/master/docs/install.md
* Install sops from https://github.com/mozilla/sops/releases
* setup aws credentials file ( ~/.aws/credentials )

Use ./sops -d|e [env-values-dir] to decrypt|encrypt secrets
Setup environment:
```
kubectl config use-context <context>
./sops -d
export ENVRIRONMENT=staging
```
Update dependencies for codefresh chart:
```
helm dependency update codefresh
```
and launch deploy script from bin/ :
```
bin/deploy-saas
```
### Switching maintenance mode
To switch maintenance mode ON
```
cd cf-helm
cf-helm$ kubectl config use-context <kubernetes_cluster_name>
cf-helm$ ./sops.sh -d  ### keys decryption 
cf-helm$ helm dependency update codefresh ### codefresh chart dependencies update
cf-helm$ export ENVIRONMENT=<environment_name> 
cf-helm$ export MAINTENANCE_MODE=true ### switch maintenance mode ON
cf-helm$ ./bin/deploy-saas ### update environment
```
To switch maintenance mode OFF
```
cf-helm$ unset MAINTENANCE_MODE ### switch maintenance mode OFF
cf-helm$ ./bin/deploy-saas ### update environment
```

