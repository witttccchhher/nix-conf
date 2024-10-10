{ inputs, ... }: {
  imports = [ ./themes/chocolate ];
  stylix = {
		enable = true;
		autoEnable = false;

    image = "${inputs.wallpapers}/chocolate/samurai.png";
    polarity = "dark";

		targets = {
      chromium.enable = true;
      console.enable = true;
      grub.enable = true;
      nixos-icons.enable = true;
		};
	};
}
