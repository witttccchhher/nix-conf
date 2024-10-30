{ pkgs, fetchurl, ... }: pkgs.writeShellScriptBin {
  name = "canvas";

  text = fetchurl {
    url = "https://github.com/adi1090x/canvas/blob/master/canvas";
    hash = "";
  };

  runtimeInputs = with pkgs; [ imagemagick feh xcolor xorg.xrandr ];
}
