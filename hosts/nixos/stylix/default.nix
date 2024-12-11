{ pkgs, inputs, config, ... }: {
  # imports = [ ./themes/witcher ];
  stylix = {
		enable = true;
		autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";

		targets = {
      console.enable = true;
      grub.enable = true;
      gnome.enable = true;
      nixos-icons.enable = true;
		};
	};
}
