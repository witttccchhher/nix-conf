{ pkgs, config, ... }: with config.lib.stylix.colors.withHashtag; {
  services.mako = {
    enable = true;
    package = pkgs.mako;

    font = "JetBrainsMono Nerd Font 13";
    backgroundColor = "${base03}";
    textColor = "${base07}";
    borderSize = 0;
    borderRadius = 15;
    progressColor = "${base0D}";
  };
}
