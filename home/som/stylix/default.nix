{ pkgs, config, inputs, ... }: {
  imports = [ ./themes/chocolate ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = "${inputs.wallpapers}/chocolate/samurai.png";
    polarity = "dark";
    
    cursor = {
			name = "GoogleDot-Black";
			package = pkgs.google-cursor;
			size = 21;
		};

    fonts = {
			monospace = {
				name = "Open Sans";
				package = pkgs.google-fonts.override { fonts = [ "OpenSans" ]; };
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
      btop.enable = true;
      firefox.enable = true;
      gtk.enable = true;
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
    };
  };
}
