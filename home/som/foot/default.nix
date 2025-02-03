{ pkgs, config, ... }: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = "CommitMono Nerd Font:size=12, JetBrainsMono Nerd Font:size=12";
        font-bold = "CommitMono Nerd Font:size=12:style=Bold, JetBrainsMono Nerd Font:size=12:style=Bold";
        font-italic = "CommitMono Nerd Font:size=12:style=Italic, JetBrainsMono Nerd Font:size=12:style=Italic";
        font-bold-italic = "CommitMono Nerd Font:size=12:style=Bold Italic, JetBrainsMono Nerd Font:size=12:style=Bold Italic";
        pad = "7x7";
        initial-window-mode = "maximized";
        box-drawings-uses-font-glyphs = "no";
        resize-by-cells = "no";
      };
      csd = {
        preferred = "none";
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
