{ pkgs, config, inputs, ... }: {
  stylix = {
    enable = true;
    autoEnable = false;

    image = let
      input = "${inputs.wallpapers}/girl/girl12.jpg";
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
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

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
        name = "CommitMono";
        package = pkgs.commit-mono;
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;

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
