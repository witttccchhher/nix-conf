{ pkgs, lib, ... }: {
  xdg.portal = {
    enable = true;
    wlr.enable = lib.mkForce false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      gnome-keyring
    ];
  };
}
