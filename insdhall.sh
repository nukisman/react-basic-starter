#!/usr/bin/env bash
NAME='local'
TARGET=.psc-package/$NAME/.set/packages.json
TMP_GEN=/tmp/packages-gen.json
TMP_EXC=/tmp/packages-exc.json

##########################################################
# Step functions
##########################################################

generatePkgs() {
  to=$1
  echo 'Generate packages.json ...'
  dhall-to-json --pretty <<< './packages.dhall' > $to
}

excludePkgs() {
  from=$1
  to=$2
  echo "Exclude packages:" `jq -nMr '$conf[0].exclude | join(", ")' --slurpfile conf psc-package.json` \
  && jq -nMr \
    --slurpfile pkgs $from \
    --slurpfile conf psc-package.json \
    '$conf[0].exclude | reduce .[] as $item ($pkgs[0]; delpaths([[$item]]))' > $to
}

writePkgs() {
  from=$1
  to=$2
  cat $from > $to
  echo "Write packages.json to" $to
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
# Run
##########################################################

mkdir -p .psc-package/$NAME/.set \
&& generatePkgs $TMP_GEN \
&& excludePkgs $TMP_GEN $TMP_EXC \
&& writePkgs $TMP_EXC $TARGET \
&& verifyDeps \
&& yarn docs