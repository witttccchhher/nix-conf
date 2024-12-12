{ inputs, pkgs, ... }: let
  mydooit = pkgs.dooit.override {
    extraPackages = [
      pkgs.dooit-extras
    ];
  };
in {
  nixpkgs.overlays = [inputs.dooit.overlay inputs.dooit-extras.overlay];
  environment.systemPackages = [
    mydooit
  ];
}
