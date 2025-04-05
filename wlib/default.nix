{
  inputs,
  ...
}: {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colorscheme = "kanagwa-dragon";
  polarity = "dark";

  wallpaperCategory = "realistic";
  wallpaperIndex = "5";
  wallpaperProcessing = {
    level = 10;
    lum = 1.0;
    preserve = false;
  };
}
