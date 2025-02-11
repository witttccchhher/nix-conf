{
  inputs,
  pkgs,
  ...
}: {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colors = with pkgs.config.lib.stylix.colors.withHashtag; {
    base00 = base00;
    base01 = base01;
    base02 = base02;
    base03 = base03;
    base04 = base04;
    base05 = base05;
    base06 = base06;
    base07 = base07;
    base08 = base08;
    base09 = base09;
    base0A = base0A;
    base0B = base0B;
    base0C = base0C;
    base0D = base0D;
    base0E = base0E;
    base0F = base0F;

    bg = base00;
    bg-sec = base01;
    bg-light = base03;
    fg = base07;
    fg-sec = base06;
    fg-dark = base04;
    red = base08;
    orange = base09;
    yellow = base0A;
    green = base0B;
    cyan = base0C;
    blue = base0D;
    pink = base0E;
    purple = base0F;
    black = base00;
    white = base07;
  };
}
