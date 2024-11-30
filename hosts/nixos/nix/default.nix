{ inputs, pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
  };
}
