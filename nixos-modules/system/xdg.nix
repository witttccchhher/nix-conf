{ pkgs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = lib.mkForce true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal
      gnome-keyring
    ];
  };
}
