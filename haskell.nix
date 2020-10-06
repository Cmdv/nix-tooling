{ pkgs, hls }:
let
  ghc = pkgs.haskell.packages.ghc883;


  self = rec {
    inherit ghc;
    cabal-install = ghc.cabal-install;
    stack = ghc.stack;
    stylish-haskell = ghc.stylish-haskell;
    haskell-language-server = hls;
    hlint = ghc.hlint;
    ghc883 = pkgs.haskell.compiler.ghc883;

    mkShell = pkgs.mkShell {
      buildInputs = [
        self.ghc883
        self.stylish-haskell
        self.hlint
        self.cabal-install
        self.stack
        self.haskell-language-server
      ];
    };
  };

in
  self
