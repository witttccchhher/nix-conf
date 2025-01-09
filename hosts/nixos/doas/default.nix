{ pkgs, ... }: {
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "som" ];
        commands = with pkgs; [
          {
            command = "${amneziawg-tools}/bin/awg-quick";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${openvpn}/bin/openvpn";
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
