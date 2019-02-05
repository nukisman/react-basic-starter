#!/usr/bin/env bash

LOCAL_BIN=node_modules/.bin
JQ=${LOCAL_BIN}/jq

if [ $OSTYPE = "darwin18" ];
then JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64";
else JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64";
fi

mkdir -p ${LOCAL_BIN} && \
  curl -L --output ${JQ} ${JQ_URL} && \
  chmod u+x ${JQ} && \
  ls -l ${JQ} && \
  yarn jq -n '["jq installed locally"]'

ln -sf ../psc-package-bin-simple/psc-package/psc-package.exe ${LOCAL_BIN}/psc-package