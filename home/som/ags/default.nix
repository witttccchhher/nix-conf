{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./agscher;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      apps
      # auth
      battery
      bluetooth
      # cava
      # greet
      # hyprland
      # mpris
      network
      notifd
      powerprofiles
      # river
      # tray
      wireplumber
    ];
  };
}
