{ lib, pkgs, ... }: {
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = lib.mkForce "Cascadia Mono NF:size=12";
        font-bold = lib.mkForce "Cascadia Mono NF:size=12:style=Bold";
        font-italic = lib.mkForce "Cascadia Mono NF:size=12:style=Italic:fontfeatures=ss01";
        font-bold-italic = lib.mkForce "Cascadia Mono NF:size=12:style=Bold Italic:fontfeatures=ss01";
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
