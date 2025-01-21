{ pkgs, inputs, config, ... }: {
  # imports = [ ./themes/jellybeans ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      console.enable = true;
      grub.enable = true;
      # gnome.enable = true;
      # nixos-icons.enable = true;
      };
  };
}
