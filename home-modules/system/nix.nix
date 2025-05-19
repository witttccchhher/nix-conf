{ inputs, pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      extra-substituters = [
        "https://cache.garnix.io"
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      extra-trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      builders-use-substitutes = true;
      auto-optimise-store = true;
      trusted-users = [
        "witcher"
        "root"
        "@wheel"
      ];
      warn-dirty = false;
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
