{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ../../../../agscher;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      notifd
    ];
  };
}
