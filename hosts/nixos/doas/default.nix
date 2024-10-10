{ pkgs, ... }: {
  security.sudo.enable = true;
  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "som" ];
        keepEnv = true;
        persist = false;
      }
    ];
  };
}
