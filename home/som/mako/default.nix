{ pkgs, config, ... }: with config.lib.stylix.colors.withHashtag; {
  services.mako = {
    enable = false;
    package = pkgs.mako;

    font = "JetBrainsMono Nerd Font 13";
    backgroundColor = "${base00}";
    textColor = "${base07}";
    borderSize = 3;
    borderColor = "${base0C}";
    borderRadius = 15;
    progressColor = "${base0C}";
    defaultTimeout = 20000;
    ignoreTimeout = true;
    anchor = "top-right";
  };
}
