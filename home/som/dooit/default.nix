{ inputs, pkgs, ... }: let
  mydooit-extras = inputs.packages.${pkgs.system}.default.override {
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
