{ pkgs, inputs, config, ... }: {
  # imports = [ ./themes/jellybeans ];
  stylix = {
    enable = true;
    autoEnable = false;

    image = "${config.stylix.image}";
    polarity = "${config.stylix.polarity}";
    base16Scheme = "${inputs.design}/neo-gen.yaml";

    targets = {
      console.enable = true;
      grub.enable = true;
      # gnome.enable = true;
      # nixos-icons.enable = true;
      };
  };
}
