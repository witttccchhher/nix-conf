{ inputs, config, ... }: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${inputs.base16}/colorschemes/oldworld.yaml";

    targets = {
      console.enable = true;
      grub.enable = true;
    };
  };
}
