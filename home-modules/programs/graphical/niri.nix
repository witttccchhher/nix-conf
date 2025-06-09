{ pkgs, inputs, ... }: {
  imports = [ inputs.niri.homeModules.niri ];

  # programs.niri = {
  #   enable = true;
  #   package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  # };
}
