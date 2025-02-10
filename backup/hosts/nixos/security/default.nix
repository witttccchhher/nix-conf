{ pkgs, ... }: {
  security.pam.services.gtklock.text = pkgs.lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "som" ];
        commands = [
          {
            command = "/home/som/.nix-profile/bin/awg-quick";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/home/som/.nix-profile/bin/openvpn";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
