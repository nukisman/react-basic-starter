#!/usr/bin/env bash
NAME='local'
TARGET=.psc-package/$NAME/.set/packages.json
EXCLUDE='$conf[0].exclude | reduce .[] as $item ($pkgs[0]; delpaths([[$item]]))'
TMP=/tmp/packages.json

verifyDeps() {
  deps=`cat psc-package.json | jq -r '.depends | .[]'`;
  for p in $deps;
  do
    echo "> Verify $p";
    psc-package verify $p;
  done
}

mkdir -p .psc-package/$NAME/.set \
&& echo 'Generate packages.json ...' \
&& dhall-to-json --pretty <<< './packages.dhall' > $TMP \
&& jq -nMr --slurpfile pkgs $TMP --slurpfile conf psc-package.json "$EXCLUDE" > $TARGET \
&& echo wrote packages.json to $TARGET \
&& verifyDeps \
&& yarn docs