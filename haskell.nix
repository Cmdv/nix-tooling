{ pkgs, hls }:
let
  ghc = pkgs.haskell.packages.ghc883;


  self = rec {
    inherit ghc;
    cabal-install = ghc.cabal-install;
    stylish-haskell = ghc.stylish-haskell;
    hlint = ghc.hlint;
    ghc883 = pkgs.haskell.compiler.ghc883;

    mkShell = pkgs.mkShell {
      buildInputs = [
        self.ghc883
        self.stylish-haskell
        self.hlint
        self.cabal-install
        hls
      ];
    };
  };

in
  self
