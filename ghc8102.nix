{ pkgs }:
let
  ghc = pkgs.haskell.packages.ghc8102;


  self = rec {
    inherit ghc;
    cabal-install = ghc.cabal-install;
    stylish-haskell = ghc.stylish-haskell;
    haskell-language-server = ghc.haskell-language-server;
    hlint = ghc.hlint;
    ghc8102 = pkgs.haskell.compiler.ghc8102;

    mkShell = pkgs.mkShell {
      buildInputs = [
        self.ghc8102
        self.stylish-haskell
        self.hlint
        self.cabal-install
        self.haskell-language-server
      ];
    };
  };

in
  self
