{ pkgs, config, inputs, ... }: {
  imports = [ ./themes/witcher ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = "${inputs.wallpapers}/chocolate/girl/girl1.jpeg";
    polarity = "dark";
    
    cursor = {
			name = "GoogleDot-Black";
			package = pkgs.google-cursor;
			size = 21;
		};

    fonts = {
			monospace = {
				name = "JetBrainsMono Nerd Font";
				package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
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
      lazygit.enable = true;
      xresources.enable = true;
      zathura.enable = true;
      neovim = {
        enable = true;
      };
    };
  };
}
