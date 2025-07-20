{ pkgs, lib, ... }:
{
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false;
    # extraRules = [
    #   {
    #     users = [ "witcher" ];
    #     groups = [ "wheel" ];
    #     commands = [
    #       {
    #         command = "${lib.getExe' pkgs.amneziawg-tools "awg-quick"}";
    #         options = [ "NOPASSWD" ];
    #       }
    #       {
    #         command = "${lib.getExe' pkgs.amneziawg-tools "awg"}";
    #         options = [ "NOPASSWD" ];
    #       }
    #     ];
    #   }
    # ];
  };

  security.polkit = {
    enable = true;
  };
}
