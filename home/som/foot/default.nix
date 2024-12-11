{ pkgs, config, ... }: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
        font-bold = "JetBrainsMono Nerd Font:size=13:style=Bold";
        font-italic = "JetBrainsMono Nerd Font:size=13:style=Italic";
        font-bold-italic = "JetBrainsMono Nerd Font:size=13:style=BoldItalic";
        pad = "7x7";
        initial-window-mode = "maximized";
        box-drawings-uses-font-glyphs = "no";
        resize-by-cells = "no";
      };
      colors = with config.lib.stylix.colors; {
        alpha = "1.0";
        background = "${base00}";
        foreground = "${base07}";
        regular0 = "${base07}";
        regular1 = "${base08}";
        regular2 = "${base0B}";
        regular3 = "${base0A}";
        regular4 = "${base0D}";
        regular5 = "${base0E}";
        regular6 = "${base0C}";
        regular7 = "${base00}";
        bright0 = "${base07}";
        bright1 = "${base08}";
        bright2 = "${base0B}";
        bright3 = "${base0A}";
        bright4 = "${base0D}";
        bright5 = "${base0E}";
        bright6 = "${base0C}";
        bright7 = "${base00}";
        dim0 = "${base07}";
        dim1 = "${base08}";
        dim2 = "${base0B}";
        dim3 = "${base0A}";
        dim4 = "${base0D}";
        dim5 = "${base0E}";
        dim6 = "${base0C}";
        dim7 = "${base00}";
        sixel0 = "${base07}";
        sixel1 = "${base0D}";
        sixel2 = "${base08}";
        sixel3 = "${base0B}";
        sixel4 = "${base0E}";
        sixel5 = "${base0C}";
        sixel6 = "${base0A}";
        sixel7 = "${base04}";
        sixel8 = "${base05}";
        sixel9 = "${base0D}";
        sixel10 = "${base08}";
        sixel11 = "${base0B}";
        sixel12 = "${base0E}";
        sixel13 = "${base0C}";
        sixel14 = "${base0A}";
        sixel15 = "${base01}";
        scrollback-indicator = "${base00} ${base0E}";
      };
      csd = {
        preferred = "server";
      };
      scrollback = {
        lines = 10000;
        multiplier = 2.0;
      };
      cursor = {
        unfocused-style = "none";
      };
    };
  };
}
