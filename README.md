# react-basic-starter (psc-packages + dhall)

Fork or clone this repo to begin

## Install tools

* Install [dhall-to-json](https://github.com/dhall-lang/dhall-lang/wiki/Getting-started%3A-Generate-JSON-or-YAML#installation)
* Install [jq](https://stedolan.github.io/jq/)
* Install [yarn](https://yarnpkg.com/en/docs/install) (or [npm](https://www.npmjs.com/get-npm))

## Install dependencies

0. `yarn` or `npm i`
0. Fix `packages.dhall`, `psc-package.json` (`depends` and `exclude`) as you need
0. `./insdhall.sh`

## Develop

`yarn start` or `npm start`

## Build and deploy (gh-pages)

`yarn deploy` or `npm run deploy`
