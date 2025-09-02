#!/bin/bash
## Reference: https://github.com/norwoodj/helm-docs
set -eux
REPO_ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
echo "$REPO_ROOT"

echo "Running Helm-Docs"
docker run \
    -v "$REPO_ROOT:/helm-docs" \
    -u $(id -u) \
    --rm \
    --entrypoint /bin/sh \
    jnorwood/helm-docs:v1.14.2 \
    -c \
    helm-docs \
    --chart-search-root=charts/codefresh \
    --template-files=README.md.gotmpl \
    --output-file=README.md
