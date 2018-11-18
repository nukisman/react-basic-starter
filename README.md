# react-basic-starter (psc-packages + dhall)

Fork or clone this repo to begin

## Install tools

* Install [dhall-to-json](https://github.com/dhall-lang/dhall-lang/wiki/Getting-started%3A-Generate-JSON-or-YAML#installation)
* Install [jq](https://stedolan.github.io/jq/)
* Install [yarn](https://yarnpkg.com/en/docs/install) (also you can use [npm](https://www.npmjs.com/get-npm) instead of yarn)

## Install npm dependencies

0. `yarn`

## Local package set

### Configure local package set

Edit `conf/packages.dhall` and `psc-package.json/exclude` field

### Generate local package set

`yarn set-gen` 

## Project dependencies

### Configure project dependencies

Edit `psc-package.json/depends` manually

or use `yarn dep-add PKG` / `yarn dep-rm PKG` - this commands save value of `psc-package.json/exclude` field (in contrast of `psc-package install PKG` / `psc-package uninstall PKG`)

### Verify dependencies and generate docs for it

`yarn deps` 

### Show docs for dependencies

`yarn show-docs` 

or just open `generated-docs/index.html`

## Develop

`yarn start`

## Build and deploy (gh-pages)

`yarn deploy` 

## REPL

`yarn repl`