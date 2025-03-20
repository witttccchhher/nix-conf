{
  inputs,
  ...
}: {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colorscheme = "oldworld";
  polarity = "dark";

  wallpaperCategory = "other";
  wallpaperIndex = "8";
  wallpaperProcessing = {
    level = 10;
    lum = 1.0;
    preserve = false;
  };
}
