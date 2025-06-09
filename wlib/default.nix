{
  pkgs,
  inputs,
  ...
}: rec {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colorscheme = "next";
  polarity = "dark";

  wallpaperCategory = "pixel";
  wallpaperIndex = "10";
  wallpaperProcessing = {
    level = 10;
    lum = 1.0;
    preserve = false;
  };

  wallpaper = { colors }: let
    input = "${inputs.wallpapers}/${wallpaperCategory}/${wallpaperCategory}${wallpaperIndex}.png";
    level = wallpaperProcessing.level;
    lum = wallpaperProcessing.lum;
    preserve = wallpaperProcessing.preserve;
  in
    pkgs.runCommand "wallpaper.png" { } ''
      ${pkgs.lutgen}/bin/lutgen apply ${input} -l ${builtins.toString level} -L ${builtins.toString lum} ${if preserve == true then "-P" else ""} -o $out -- ${
        builtins.concatStringsSep " " (with colors; [
          base00
          base01
          base02
          base03
          base04
          base05
          base06
          base07
          base08
          base09
          base0A
          base0B
          base0C
          base0D
          base0E
          base0F
        ])
      }
    '';
}
