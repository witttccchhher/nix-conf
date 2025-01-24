{ pkgs, config, inputs, ... }: {
  # imports = [ ./themes/jellybeans ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = let
      input = "${inputs.wallpapers}/girl/girl18.png";
      level = 10;
      lum = 1.0;
      preserve = false;
    in
      pkgs.runCommand "output.png" { } ''
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
    # image = "${inputs.wallpapers}/solid/solid14_custom.jpg";
    polarity = "dark";
    base16Scheme = "${inputs.design}/neo-gen.yaml";

    cursor = with inputs.nix-cursors; {
      name = "Apple-Custom";
      package = with config.lib.stylix.colors.withHashtag; packages.${pkgs.system}.apple-cursor.override {
        background_color = base00;
        outline_color = base06;
        accent_color = base0B;
      };
      size = 21;
    };

    fonts = {
      monospace = {
        name = "Cascadia Code";
        package = pkgs.cascadia-code;
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;

      sizes = {
        desktop = 13;
        popups = 13;
        applications = 13;
        terminal = 13;
      };
    };

    targets = {
      btop.enable = true;
      # firefox.enable = true;
      gtk.enable = true;
      # gnome.enable = true;
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
    };
  };
}
