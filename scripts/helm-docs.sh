#!/bin/bash
## Reference: brew install norwoodj/tap/helm-docs
helm-docs \
    --chart-search-root=charts/codefresh \
    --template-files=../../README.md.gotmpl \
    --output-file=../../README.md
