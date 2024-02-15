#!/bin/bash
SRCROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHARTDIR="codefresh"
VALUESFILE="$CHARTDIR/.ci/values/values-all-images.yaml"
OUTPUTFILE=$1

helm dep update $CHARTDIR

helm template release-name $CHARTDIR -f $VALUESFILE \
  | grep -E 'image:' | grep -v "{}" \
  | awk -F ': ' '{print $2}' | awk NF \
  | tr -d '"' | tr -d ',' | cut -f1 -d"@" \
  | sort -u \
  > $OUTPUTFILE