# Release Process

## Releasing a new version

For a **MAJOR** or **MINOR** release:

- Ensure that `codefresh(deps): bump subcharts` PR has been merged to `main`. This PR updates the Codefresh subchart versions in `Chart.yaml` to the latest released versions.
- Create a new `release-x.y` branch from `main`, where `x.y` is the new major or minor version number.
```shell
git checkout -b release-x.y main
```
> **Note!** Just creating a release branch without any commits will NOT create release branches for dependent components (cf-api, cf-ui, argo-platform, etc)! Newly created `release-x.y` branch must be updated!
- Open a PR against `release-x.y` branch
```shell
git checkout -b update-release-x.y release-x.y
```
- *optional* Update subchart versions in `Chart.yaml` (if not already done in `codefresh(deps): bump subcharts` PR)
- *optional* Update `values.yaml`, `templates/**` files if required
- Run `./scripts/update_re_images.sh` to update runtime images with latest from SAAS to `values.yaml`
- Run `./scripts/helm-docs.sh` to update `README.md` files
- Commit and push changes, trigger CI with `/test` comment, make sure all checks pass, then merge the PR
- When the PR is merged, the release draft will be created automatically and `codefresh/x.y.z: prepare chart content for release` PR will be opened with the updated chart `.version` and `artifacthub.io/changes` annotation.
> **Note!** If more changes are required before the release, repeat the steps above by creating a new PR against `release-x.y` branch. Release will not be published until `codefresh/x.y.z: prepare chart content for release` PR is merged!
- Review `codefresh/x.y.z: prepare chart content for release` PR. Update `artifacthub.io/changes` annotation if needed.
- Review and update release notes in the corresponding release draft on GitHub.
- Merge the PR to create a new release. Release will be published automatically.

For a **PATCH** release:

- Create a new branch from the corresponding `release-x.y` branch, where `x.y` is the major and minor version numbers of the release.
```shell
git checkout -b patch/something release-x.y
```
- Make necessary changes to the chart like updating versions of **required** dependencies in `Chart.yaml`, updating `values.yaml`, `templates/**` files if required and etc.
> **Note!** If these changes are required for the next major or minor release, make sure to cherry-pick them to the `main` branch as well with a separate PR.
- Run `./scripts/helm-docs.sh` to update `README.md` files
- Commit and push changes, open a PR against `release-x.y` branch, trigger CI with `/test` comment, make sure all checks pass, then merge the PR
- When the PR is merged, the release draft will be created automatically with `codefresh/x.y.z: prepare chart content for release` PR
- Review `codefresh/x.y.z: prepare chart content for release` PR. Update `artifacthub.io/changes` annotation if needed.
- Review and update release notes in the corresponding release draft on GitHub.
- Merge the PR to create a new release. Release will be published automatically.

## Versioning in CI and Promote pipelines

- Every commit to `feat` branches creates `oci://quay.io/codefresh/dev/codefresh:0.0.0-<BRANCH_NAME_NORMALIZED>-<SHORT_SHA>` helm chart
- Every commit to `main` branch creates `oci://quay.io/codefresh/dev/codefresh:0.0.0-<SHORT_SHA>` helm chart
- Every commit to `release-x.y` branches creates `oci://quay.io/codefresh/dev/codefresh:x.y.z` helm chart, where `x.y.z` is release draft version
- Every release publishes `oci://quay.io/codefresh/codefresh:x.y.z` helm chart, where `x.y.z` is the released version
