{ pkgs, inputs, config, ... }: {
  # imports = [ ./themes/witcher ];
  stylix = {
		enable = true;
		autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${config.stylix.base16Scheme}";

		targets = {
      chromium.enable = true;
      console.enable = true;
      grub.enable = true;
      gnome.enable = true;
      nixos-icons.enable = true;
		};
	};
}
