{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs.astal; [
    io
    gjs
    tray
    auth
    apps
    mpris
    greet
    notifd
    astal3
    wireplumber
    powerprofiles
    network
    bluetooth
    battery
  ];

  programs.ags = {
    enable = true;
    configDir = ./agscher;
    extraPackages = with pkgs.astal; [
      io
      gjs
      tray
      auth
      apps
      mpris
      greet
      notifd
      astal3
      wireplumber
      powerprofiles
      network
      bluetooth
      battery
    ];
  };
}
