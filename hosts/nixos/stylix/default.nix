{ pkgs, inputs, config, ... }: {
  stylix = {
    enable = true;
    autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    targets = {
      console.enable = true;
      grub.enable = true;
    };
  };
}
