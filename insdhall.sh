#!/usr/bin/env bash
NAME='local'
TARGET=.psc-package/$NAME/.set/packages.json
EXCLUDE='$conf[0].exclude | reduce .[] as $item ($pkgs[0]; delpaths([[$item]]))'
TMP=/tmp/packages.json

mkdir -p .psc-package/$NAME/.set \
&& ~/bin/dhall/dhall-to-json --pretty <<< './packages.dhall' > $TMP \
&& jq -nMr --slurpfile pkgs $TMP --slurpfile conf psc-package.json '$conf[0].exclude | reduce .[] as $item ($pkgs[0]; delpaths([[$item]]))' > $TARGET \
&& echo wrote packages.json to $TARGET \
&& psc-package install