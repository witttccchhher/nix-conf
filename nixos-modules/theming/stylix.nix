{ w, inputs, config, ... }: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    image = "${config.stylix.image}";
    polarity = w.polarity;
    base16Scheme = "${inputs.base16}/colorschemes/${w.colorscheme}.yaml";

    targets = {
      console.enable = true;
      grub.enable = true;
    };
  };
}
