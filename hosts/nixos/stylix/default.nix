{ pkgs, inputs, config, ... }: {
  # imports = [ ./themes/witcher ];
  stylix = {
		enable = true;
		autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";

		targets = {
      chromium.enable = true;
      console.enable = true;
      grub.enable = true;
      nixos-icons.enable = true;
		};
	};
}
