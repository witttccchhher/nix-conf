{ pkgs, config, ... }: with config.lib.stylix.colors.withHashtag; {
  services.mako = {
    enable = true;
    package = pkgs.mako;

    font = "JetBrainsMono Nerd Font 13";
    backgroundColor = "${base02}";
    textColor = "${base07}";
    borderSize = 3;
    borderColor = "${base04}";
    borderRadius = 15;
    progressColor = "${base0D}";
    defaultTimeout = 20000;
    ignoreTimeout = true;
    anchor = "top-center";
  };
}
