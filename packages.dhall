let mkPkg = https://raw.githubusercontent.com/justinwoo/spacchetti/111118/src/mkPackage.dhall
in let pkgs = https://raw.githubusercontent.com/justinwoo/spacchetti/111118/src/packages.dhall
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
          "v5.0.0"
    }
in pkgs
   ⫽ overrides
