{ pkgs }:
let
  ghc = pkgs.haskell.packages.ghc883;


  self = rec {
    inherit ghc;
    cabal-install = ghc.cabal-install;
    stylish-haskell = ghc.stylish-haskell;
    haskell-language-server = ghc.haskell-language-server;
    hlint = ghc.hlint;
    ghc883 = pkgs.haskell.compiler.ghc883;

    mkShell = pkgs.mkShell {
      buildInputs = [
        self.ghc883
        self.stylish-haskell
        self.hlint
        self.cabal-install
        self.haskell-language-server
      ];
    };
  };

in
  self
