{
  w,
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.stylix.homeModules.stylix
    inputs.niri.homeModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    image = w.wallpaper { colors = config.lib.stylix.colors; };
    polarity = w.polarity;
    base16Scheme = "${inputs.base16}/colorschemes/${w.colorscheme}.yaml";

    cursor = with inputs.nix-cursors; {
      name = "Apple-Custom";
      package =
        with config.lib.stylix.colors.withHashtag;
        packages.${pkgs.system}.apple-cursor.override {
          background_color = base00;
          outline_color = base07;
          accent_color = base0D;
        };
      size = 21;
    };

    fonts = {
      monospace = {
        name = "Commit Mono";
        package = pkgs.cascadia-code;
      };
      sansSerif = {
        name = "Inter";
        package = pkgs.google-fonts.override { fonts = [ "Inter" ]; };
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = config.stylix.fonts.sansSerif;

      sizes = {
        desktop = 12;
        popups = 12;
        applications = 12;
        terminal = 12;
      };
    };

    targets = {
      gnome.enable = true;
      vesktop.enable = true;
      glance.enable = true;
      cava.enable = true;
      eog.enable = true;
      btop.enable = true;
      foot.enable = true;
      kitty.enable = true;
      fzf.enable = true;
      gtk.enable = true;
      qt.enable = true;
      yazi.enable = true;
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
      zed.enable = true;
      niri.enable = true;
    };
  };
}
