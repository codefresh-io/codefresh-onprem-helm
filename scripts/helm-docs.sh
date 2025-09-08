#!/bin/bash
## Reference: https://github.com/norwoodj/helm-docs
helm-docs \
    --chart-search-root=charts/codefresh \
    --template-files=../../README.md.gotmpl \
    --output-file=../../README.md
