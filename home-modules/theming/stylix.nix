{ w, pkgs, config, inputs, ... }: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    image = let
      input = "${inputs.wallpapers}/${w.wallpaperCategory}/${w.wallpaperCategory}${w.wallpaperIndex}.png";
      level = w.wallpaperProcessing.level;
      lum = w.wallpaperProcessing.lum;
      preserve = w.wallpaperProcessing.preserve;
    in
      pkgs.runCommand "wallpaper.png" { } ''
        ${pkgs.lutgen}/bin/lutgen apply ${input} -l ${builtins.toString level} -L ${builtins.toString lum} ${if preserve == true then "-P" else ""} -o $out -- ${
          builtins.concatStringsSep " " (with config.lib.stylix.colors; [
            base00
            base01
            base02
            base03
            base04
            base05
            base06
            base07
            base08
            base09
            base0A
            base0B
            base0C
            base0D
            base0E
            base0F
          ])
        }
      '';
    polarity = w.polarity;
    base16Scheme = "${inputs.base16}/colorschemes/${w.colorscheme}.yaml";

    cursor = with inputs.nix-cursors; {
      name = "Apple-Custom";
      package = with config.lib.stylix.colors.withHashtag; packages.${pkgs.system}.apple-cursor.override {
        background_color = base00;
        outline_color = base07;
        accent_color = base0D;
      };
      size = 21;
    };

    fonts = {
      monospace = {
        name = "Cascadia Mono";
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
      bat.enable = true;
      cava.enable = true;
      eog.enable = true;
      btop.enable = true;
      foot.enable = true;
      kitty.enable = true;
      fzf.enable = true;
      sway.enable = true;
      gtk.enable = true;
      yazi.enable = true;
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
    };
  };
}
