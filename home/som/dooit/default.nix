{ inputs, pkgs, ... }: let
  mydooit-extras = inputs.dooit-extras.packages.${pkgs.system}.default.overrideAttrs {
    propagatedBuildInputs = [ pkgs.python311Packages.tkinter ];
  };
  mydooit = inputs.dooit.packages.${pkgs.system}.default.override {
    extraPackages = [
      mydooit-extras
    ];
  };
in {
  home.packages = [
    mydooit
  ];
}
