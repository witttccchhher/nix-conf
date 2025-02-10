{ lib, ... }: {
  programs = {
    xwayland.enable = lib.mkForce false;
    nm-applet.enable = false;
  };
}
