{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  # home.packages = with pkgs.astal; [
  #   astal3
  #   astal4
  #   io
  #   gjs
  #   auth
  #   apps
  #   mpris
  #   greet
  #   notifd
  #   wireplumber
  #   powerprofiles
  #   network
  #   bluetooth
  #   battery
  # ];

  programs.ags = {
    enable = true;
    configDir = ./agscher;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      auth
      apps
      mpris
      greet
      notifd
      wireplumber
      powerprofiles
      network
      bluetooth
      battery
      tray
    ];
  };
}
