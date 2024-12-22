{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.doom ];
  };
  services.emacs = {
    enable = true;
    client = {
      arguments = [ "-nw" ];
      enable = true;
    };
    socketActivation.enable = true;
    startWithUserSession = true;
  };
}
