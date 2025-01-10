{ lib, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = lib.mkForce true;
  };
}
