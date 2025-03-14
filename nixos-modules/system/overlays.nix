{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];
}
