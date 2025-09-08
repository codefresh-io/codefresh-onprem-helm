# Release Process

## Releasing a new version

For a **MAJOR** or **MINOR** release:

- Checkout from `main` branch
```shell
git checkout -b onprem-X.Y main
```
- Merge latest `release-X.Y` into the new branch
```shell
git merge --no-ff release-X.Y
```
- Resolve any merge conflicts.
- In `Chart.yaml`:
    - Update `.version` and `.appVersion`
    - For Codefresh dependencies (i.e. with `repository: oci://quay.io/codefresh/charts`) update version to use latest (i.e. `version: *`)
    - Update `artifacthub.io/changes` annotation
- Update `values.yaml`, `templates/**`, etc with required changes
- Run `helm dep update` to update dependencies
- Run `./charts/codefresh/.ci/runtime-images.sh`
- Run `./scripts/helm-docs.sh`
- Commit changes and open the PR against the `main` branch
- Comment `/test` to trigger CI pipeline
- Merge the PR after successful CI build
- After merging the PR the corresponding `release-X.Y` branch will be created. For the next patches, `release-X.Y` branch must be used as BASE branch!

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
- Run `./scripts/helm-docs.sh`
- Commit changes and open the PR against the corresponding `release-<MAJOR>.<MINOR>` branch
- Comment `/test` to trigger CI pipeline
- Merge the PR after successful CI build
