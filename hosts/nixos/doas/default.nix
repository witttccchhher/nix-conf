{ pkgs, ... }: {
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "som" ];
        commands = [
          {
            command = "awg-quick";
            options = [ "NOPASSWD" ];
          }
          {
            command = "openvpn";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
  security.doas = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "som" ];
        keepEnv = true;
        persist = true;
      }
      {
        cmd = "awg-quick";
        noPass = true;
      }
      {
        cmd = "openvpn";
        noPass = true;
      }
    ];
  };
}
