let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  easy-ps = import sources.easy-purescript-nix { inherit pkgs; };
  haskell = import ./haskell.nix { inherit pkgs; };
  haskell-8-10-2 = import ./haskell-8-10-2.nix { inherit pkgs; };
  purescript = import ./purescript.nix { inherit pkgs easy-ps; };

  self = {
    inherit pkgs haskell haskell-8-10-2 purescript;
  };

in
  self
