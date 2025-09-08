# Release Process

## Releasing a new version

For a **MAJOR** or **MINOR** release:

- Ensure that `codefresh(deps): bump subcharts` PR has been merged to `main`. This PR updates the Codefresh subchart versions in `Chart.yaml` to the latest released versions.
- Create a new `release-x.y` branch from `main`, where `x.y` is the new major or minor version number.
```shell
git checkout -b release-x.y main
```
> Just creating a release branch without any commits will NOT create release branches for dependent components (cf-api, cf-ui, argo-platform, etc)! Newly created `release-x.y` branch must be updated!
- Open a PR against `release-x.y` branch
```shell
git checkout -b update-release-x.y release-x.y
```
- **optional** Update subchart versions in `Chart.yaml` (if not already done in `codefresh(deps): bump subcharts` PR)
- **optional** Update `values.yaml`, `templates/**` files if required
- Run `./scripts/helm-docs.sh` to update `README.md` files
- Commit and push changes, trigger CI with `/test` comment, make sure all checks pass, then merge the PR
- When the PR is merged, the release draft will be created automatically and `codefresh/x.y.z: prepare chart content for release` PR will be opened with the updated chart `.version` and `artifacthub.io/changes` annotation.
- Review `codefresh/x.y.z: prepare chart content for release` PR. Update `artifacthub.io/changes` annotation if needed.
- Merge the PR to create a new release. Release will be published automatically.

For a **PATCH** release:


## Versioning in CI and Promote pipelines
