{
  inputs,
  ...
}: {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colorscheme = "oldworld";
  polarity = "dark";

  wallpaperCategory = "pixel";
  wallpaperIndex = "7";
  wallpaperProcessing = {
    level = 10;
    lum = 1.0;
    preserve = true;
  };
}
