#!/bin/bash
set -eux
MYDIR=$(dirname $0)
REPO_ROOT="${MYDIR}/../.."

echo $REPO_ROOT

echo "Update value with system/root runtime images"
docker run \
    -v "$REPO_ROOT:/codefresh" \
    -v $HOME/.cfconfig:/.cfconfig \
    -u $(id -u) \
    --rm \
    quay.io/codefresh/codefresh-shell:0.0.20 \
    /bin/bash /codefresh/scripts/update_re_images.sh
