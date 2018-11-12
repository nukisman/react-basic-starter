#!/usr/bin/env bash
NAME='local'
TARGET=.psc-package/$NAME/.set/packages.json
mkdir -p .psc-package/$NAME/.set \
&& ~/bin/dhall/dhall-to-json --pretty <<< './packages.dhall' \
| jq 'del(.chanpon)' \
> $TARGET \
&& echo wrote packages.json to $TARGET \
&& psc-package install