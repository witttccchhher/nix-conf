{ pkgs, ... }: {
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      { package = blur-my-shell; }
      { package = appindicator; }
      { package = just-perfection; }
      { package = rounded-window-corners-reborn; }
      { package = panel-corners; }
      { package = useless-gaps; }
    ];
  };

  services = {
    gnome-keyring.enable = true;
    polkit-gnome.enable = true;
  };
}
