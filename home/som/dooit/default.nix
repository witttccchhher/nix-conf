{ inputs, pkgs, ... }: let
  mydooit = inputs.dooit.packages.${pkgs.system}.default.override {
    extraPackages = [
      inputs.dooit-extras.packages.${pkgs.system}.default
      pkgs.python311Packages.tkinter
      pkgs.tk
    ];
  };
in {
  home.packages = [
    mydooit
  ];
}
