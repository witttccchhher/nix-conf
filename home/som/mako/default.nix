{ pkgs, config, ... }: with config.lib.stylix.colors.withHashtag; {
  services.mako = {
    enable = true;
    package = pkgs.mako;

    font = "JetBrainsMono Nerd Font 13";
    backgroundColor = "${base00}";
    textColor = "${base06}";
    borderSize = 3;
    borderColor = "${base0B}";
    borderRadius = 15;
    progressColor = "${base0C}";
    defaultTimeout = 20000;
    ignoreTimeout = true;
    anchor = "top-right";
  };
}
