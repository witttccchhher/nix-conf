{ pkgs, ... }: {
  security.sudo.enable = true;
  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "wtchr" ];
        keepEnv = true;
        persist = false;
      }
    ];
  };
}
