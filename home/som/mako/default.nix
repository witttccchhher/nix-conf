{ pkgs, config, ... }: with config.lib.stylix.colors.withHashtag; {
  services.mako = {
    enable = true;
    package = pkgs.mako;

    font = "JetBrainsMono Nerd Font 13";
    backgroundColor = "${base01}";
    textColor = "${base07}";
    borderSize = 3;
    borderColor = "${base03}";
    borderRadius = 15;
    progressColor = "${base0D}";
    defaultTimeout = 20000;
    ignoreTimeout = true;
    anchor = "top-right";
  };
}
