{ pkgs, config, inputs, ... }: {
  # imports = [ ./themes/witcher ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = let
      input = "${inputs.wallpapers}/other/other5.png";
      level = 10;
      lum = 0.6;
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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    
    cursor = {
			name = "GoogleDot-Black";
			package = pkgs.google-cursor;
			size = 21;
		};

    fonts = {
			monospace = {
				name = "JetBrainsMono Nerd Font";
				package = pkgs.nerd-fonts.jetbrains-mono;
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
      firefox.enable = true;
      gtk.enable = true;
      gnome.enable = true;
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
    };
  };
}
