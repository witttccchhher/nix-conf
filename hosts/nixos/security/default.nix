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
}
