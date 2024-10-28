{ inputs, config, ... }: {
  imports = [ ./themes/witcher ];
  stylix = {
		enable = true;
		autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "dark";

		targets = {
      chromium.enable = true;
      console.enable = true;
      grub.enable = true;
      nixos-icons.enable = true;
		};
	};
}
