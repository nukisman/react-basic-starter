-- See: https://github.com/spacchetti/spacchetti/releases
let mkPkg = https://raw.githubusercontent.com/justinwoo/spacchetti/20190131/src/mkPackage.dhall
in let pkgs = https://raw.githubusercontent.com/justinwoo/spacchetti/20190131/src/packages.dhall
in let overrides =
    { react-basic =
        mkPkg
          [ "exceptions"
          , "effect"
          , "console"
          , "web-events"
          , "web-html"
          , "aff"
          , "typelevel-prelude"
          , "unsafe-coerce"
          , "record"
          , "web-dom"
          , "nullable"
          , "functions"
          ]
          "https://github.com/lumihq/purescript-react-basic.git"
          "v8.0.0"
    , simple-ajax =
        mkPkg
          [ "prelude"
          , "console"
          , "affjax"
          , "simple-json"
          ]
          "https://github.com/dariooddenino/purescript-simple-ajax.git"
          "v0.5.0"
    , dom-filereader =
        mkPkg
          [ "arraybuffer-types"
          , "web-html"
          , "aff"
          , "web-file"
          ]
          "https://github.com/nwolverson/purescript-dom-filereader"
          "v4.0.0"
    }
in pkgs
   ⫽ overrides
