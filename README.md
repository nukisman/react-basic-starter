# react-basic-starter (psc-packages + dhall)

Fork or clone this repo to begin

## Install tools

* Install [yarn](https://yarnpkg.com/en/docs/install) (also you can use [npm](https://www.npmjs.com/get-npm) instead of yarn)
* Install [jq](https://stedolan.github.io/jq/)

## (Re)Install npm and dhall dependencies

0. `yarn`
0. `yarn refresh`

## Local package set

### Configure local package set

Edit `conf/packages.dhall` and `psc-package.json/exclude` field

### Generate local package set

`yarn set-gen` 

## Project dependencies

### Configure project dependencies

Edit `psc-package.json/depends` manually

or use `yarn dep-add PKG` / `yarn dep-rm PKG` - this commands save value of `psc-package.json/exclude` field (in contrast of `psc-package install PKG` / `psc-package uninstall PKG`)

### Optional: Verify dependencies and generate docs for it

`yarn deps-verify` (takes VERY LONG TIME !!!) 

### Build Web App

`yarn build`

or manually

* `yarn deps-install` - Install project dependencies
* `yarn build-purs` - Build PureScript project
* `yarn build-webpack` - Build web app via webpack

### Documentation

* `yarn docs-build` - build documentation
* `yarn docs-show` - run it in Chrome

or just open `generated-docs/index.html`

## Develop

### Configure

Add `127.0.0.1       dev.com` to `/wtc/hosts`

### Start dev server

`yarn start`

## REPl

`yarn repl`