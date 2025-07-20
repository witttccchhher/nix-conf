{ pkgs, ... }:
{
  console = {
    enable = true;
    font = with pkgs; "${terminus_font}/share/consolefonts/ter-v16n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
}
