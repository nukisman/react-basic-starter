#!/usr/bin/env bash
NAME='local'
TARGET=.psc-package/$NAME/.set/packages.json
CONF=./conf
TMP_GEN=/tmp/packages-gen.json
TMP_EXC=/tmp/packages-exc.json
TMP_PSC=/tmp/psc-package.json

##########################################################
# Set of packages
##########################################################

generateSet() {
  to=$1
  echo 'Generate package set ...'
  dhall-to-json --pretty <<< "$CONF/packages.dhall" > $to
}

excludeFromSet() {
  from=$1
  to=$2
  echo "Exclude packages from set:" `jq -nMr '$conf[0].exclude | join(", ")' --slurpfile conf psc-package.json` \
  && jq -nMr \
    --slurpfile pkgs $from \
    --slurpfile conf psc-package.json \
    '$conf[0].exclude | reduce .[] as $item ($pkgs[0]; delpaths([[$item]]))' > $to
}

writeSet() {
  from=$1
  to=$2
  cat $from > $to
  echo "Write set to" $to
}

linkSet() {
  from=$1
  to=$2
  fromFixed=../$from # todo: Auto relative path
  echo "Link: $to -> $fromFixed"
  ln -fs $fromFixed $to
}

verifyDeps() {
  echo "Verify dependencies ..."
  deps=`cat psc-package.json | jq -r '.depends | .[]'`;
  for p in $deps;
  do
    echo "> Verify $p";
    psc-package verify $p;
  done
}

##########################################################
# Project dependencies
##########################################################

depAdd() {
  pkg=$1
  tmp=`mktemp`
  psc-package verify $pkg \
  && jq -n \
    --arg p $pkg \
    'input | setpath(["depends"]; getpath(["depends"]) + [$p] | unique | sort)' \
    psc-package.json > $tmp \
  && cat $tmp > psc-package.json
}

depRm() {
  pkg=$1
  tmp=`mktemp`
  jq -n \
    --arg p $pkg \
    'input | setpath(["depends"]; getpath(["depends"]) - [$p] | unique)' \
    psc-package.json > $tmp \
  && cat $tmp > psc-package.json
}

##########################################################
# Run
##########################################################

CMD=$1
ARG1=$2
case "$CMD" in
  # todo: set-exclude
  # todo: set-include
  set-gen)
    mkdir -p .psc-package/$NAME/.set \
    && generateSet $TMP_GEN \
    && excludeFromSet $TMP_GEN $TMP_EXC \
    && writeSet $TMP_EXC $TARGET \
    && linkSet $TARGET $CONF/packages.json
    ;;
  deps)
    verifyDeps \
    && yarn docs
    ;;
  dep-add)
    depAdd $ARG1
    ;;
  dep-rm)
    depRm $ARG1
    ;;
  *) # TODO: Better help
    echo "$0 (set-gen | deps | dep-add PKG | dep-rm PKG)"
    ;;
esac