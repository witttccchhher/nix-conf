{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = /home/som/agscher;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      notifd
    ];
  };
}
