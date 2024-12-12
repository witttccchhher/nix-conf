{ inputs, pkgs, ... }: {
  # imports = [
  #   inputs.dooit.homeManagerModules.default
  # ];
  #
  # nixpkgs.overlays = [ inputs.dooit-extras.overlay ];
  # programs.dooit = {
  #   enable = true;
  #   extraPackages = [ pkgs.dooit-extras ];
  # };
  home.packages = with pkgs; [
    inputs.dooit.packages.${system}.default
    inputs.dooit-extras.packages.${system}.default
  ];
}
