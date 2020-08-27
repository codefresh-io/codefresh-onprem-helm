#!/usr/bin/env bash

set -ue

DEBUG=${DEBUG:-false}

if [ ${DEBUG} == "true" ]; then
    set -x
fi

msg() { echo -e "\e[32mINFO ---> $1\e[0m"; }
err() { echo -e "\e[31mERR ---> $1\e[0m" ; return 1; }

ONPREM_MASTER_BRANCH=${ONPREM_MASTER_BRANCH:-onprem-alignment}
REPO_OWNER=${REPO_OWNER:-codefresh-io}
REPO_NAME=${REPO_NAME:-cf-helm}

GIT_ORIGIN_NAME=${GIT_ORIGIN_NAME:-origin}
CI=${CI:-false}

checkGitWorkdir() {
    if [ -z "$(git status --untracked-files=no --porcelain)" ]; then 
        msg "Git working directory is clean, continuing..."
    else 
        err "Git working is not clean, stopping. The script should be run on a clean git working directory"
    fi
}

chartVersionBump() {
    yq w -i codefresh/Chart.yaml version "${new_version}" 
    msg "Codefresh Helm Chart will be updated to ${new_version}"
}

updateRuntimeImages() {
    runtimeJson=$(mktemp)
    codefresh get sys-re system/default-plan --extend -o json > $runtimeJson

        RUNTIME_IMAGES=(
            ENGINE_IMAGE
            CONTAINER_LOGGER_IMAGE
            DOCKER_PUSHER_IMAGE
            DOCKER_PULLER_IMAGE
            DOCKER_BUILDER_IMAGE
            GIT_CLONE_IMAGE
            COMPOSE_IMAGE
            KUBE_DEPLOY
            FS_OPS_IMAGE
        )

        for k in ${RUNTIME_IMAGES}; do
            if [[ "$k" == "ENGINE_IMAGE" ]]; then
                image="$(jq -er .runtimeScheduler.image $runtimeJson)"
                yq w -i codefresh/env/on-prem/versions.yaml engineImage ${image}
            else
                image="$(jq -er .runtimeScheduler.envVars.$k $runtimeJson)"
                yq w -i codefresh/env/on-prem/versions.yaml $k ${image}
            fi
        done

        msg "The list of updated runtime images:\n"
        echo -e "\e[33m$(cat codefresh/env/on-prem/versions.yaml)\e[0m"
}

updateDependencies() {
    echo "Exec helm dependency update --skip-refresh codefresh"
    helm dependency update --skip-refresh --debug codefresh
}

prepareGit() {
    git clean -dfx
    pr_branch="onprem-update-${new_version}"

    git fetch ${GIT_ORIGIN_NAME}
    git checkout -B ${pr_branch} ${GIT_ORIGIN_NAME}/${ONPREM_MASTER_BRANCH}
}

configGitCiBot() {
    git config --global user.email ${CI_BOT_EMAIL}
    git config --global user.name ${CI_BOT_NAME}
    git remote set-url origin https://${CI_BOT_NAME}:${GITHUB_TOKEN}@github.com/${REPO_OWNER}/${REPO_NAME}.git
}

gitCommitAndPush() {
    msg "Committing requirements.lock, Chart.yaml and pushing to the ${pr_branch} branch..."

    git add codefresh/requirements.lock codefresh/Chart.yaml codefresh/env/on-prem/versions.yaml
    git commit -m "Update onprem to ${new_version}"
    git push ${GIT_ORIGIN_NAME} ${pr_branch} -f
}

githubPR() {
    msg "Opening a PR named \"onprem-update-${new_version}\" on Github..."

    if ! existingPR; then
        curl --fail -X POST -d "{\"title\": \"onprem-update-${new_version}\",\"body\": \"onprem-update-${new_version}\",\"head\": \"${pr_branch}\",\"base\": \"${ONPREM_MASTER_BRANCH}\"}" -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/pulls"
        msg "PR \"onprem-update-${new_version}\" has been successfully created"
    else
        msg "No need to create the PR - it already exists"
    fi
}

existingPR() {
   curl -s --fail -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/pulls?state=open&base=${ONPREM_MASTER_BRANCH}&head=${REPO_OWNER}:${pr_branch}" | grep "\"title\": \"onprem-update-${new_version}\""
}

new_version="$(semver-cli inc patch $(yq r codefresh/Chart.yaml version))"

if [ ${CI} == 'true' ]; then
    configGitCiBot
    prepareGit
    chartVersionBump
    updateRuntimeImages
    gitCommitAndPush
    githubPR
else
    checkGitWorkdir
    prepareGit
    chartVersionBump
    updateRuntimeImages
    updateDependencies
    gitCommitAndPush
    msg "Please open a PR from ${pr_branch} to ${ONPREM_MASTER_BRANCH}"
fi