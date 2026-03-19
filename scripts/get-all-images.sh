#!/bin/bash
SRCROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHARTDIR="charts/codefresh"
OUTPUTFILE=$1

helm dep update $CHARTDIR

helm template release-name $CHARTDIR -f \
  | grep -E 'image:' | grep -v "{}" \
  | awk -F ': ' '{print $2}' | awk NF \
  | tr -d '"' | tr -d ',' | cut -f1 -d"@" \
  | sort -u \
  > $OUTPUTFILE
