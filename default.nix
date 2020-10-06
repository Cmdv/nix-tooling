let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  hls =  import sources.haskell-language-server {};
  easy-ps = import sources.easy-purescript-nix { inherit pkgs; };
  haskell = import ./haskell.nix { inherit pkgs hls; };
  purescript = import ./purescript.nix { inherit pkgs easy-ps; };

  self = {
    inherit pkgs haskell purescript;
  };

in
  self
