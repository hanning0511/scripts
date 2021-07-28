#!/usr/bin/env bash

STUCKED_NS=$1

kubectl get namespace $STUCKED_NS -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/$STUCKED_NS/finalize -f -
