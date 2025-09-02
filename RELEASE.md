# Release Process

## Releasing a new version

For a **PATCH** release:

- Checkout from the corresponding `release-<MAJOR>.<MINOR>` branch
```shell
git checkout -b onprem-X.Y.Z release-X.Y
```
- Update `.version` in Chart.yaml
- Update `artifacthub.io/changes` annotation in Chart.yaml
- *optional* Update `dependencies` in Chart.yaml
- *optional* Update `values.yaml`, `templates/**`, etc with required changes
- Run `helm dep update` to update dependencies
- *optional* Run `./charts/codefresh/.ci/runtime-images.sh`
- Run `./charts/codefresh/.ci/helm-docs.sh`
- Commit changes and open the PR against the corresponding `release-<MAJOR>.<MINOR>` branch
- Comment `/test` to trigger CI pipeline
- Merge the PR after successful CI build
