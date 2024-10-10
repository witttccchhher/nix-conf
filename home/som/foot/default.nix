{ pkgs, config, extraColors, ... }: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = "scientifica:size=17, JetBrainsMono Nerd Font:size=14";
        font-bold = "scientifica:size=17, JetBrainsMono Nerd Font:size=14";
        font-italic = "scientifica:size=17:style=Italic, JetBrainsMono Nerd Font:size=14:style=Italic";
        font-bold-italic = "scientifica:size=17:style=BoldItalic, JetBrainsMono Nerd Font:size=14:style=Italic";
        pad = "7x7";
        initial-window-mode = "maximized";
      };
      colors = with config.lib.stylix.colors; {
        background="${base00}";
        foreground="${base05}";
        regular0="${base02}";
        regular1="${base08}";
        regular2="${base0B}";
        regular3="${base0A}";
        regular4="${base0D}";
        regular5="${base0C}";
        regular6="${extraColors.base0G}";
        regular7="${base05}";
      };
      csd = {
        preferred = "none";
      };
    };
  };
}
