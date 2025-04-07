{ pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.just-perfection; }
      { package = pkgs.gnomeExtensions.quick-settings-tweaker; }
      { package = pkgs.gnomeExtensions.rounded-window-corners-reborn; }
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
    ];
  };
}
