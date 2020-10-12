let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  easy-ps = import sources.easy-purescript-nix { inherit pkgs; };
  ghc883 = import ./ghc883.nix { inherit pkgs; };
  ghc8102 = import ./ghc8102.nix { inherit pkgs; };
  purescript = import ./purescript.nix { inherit pkgs easy-ps; };

  self = {
    inherit pkgs ghc883 ghc8102 purescript;
  };

in
  self
