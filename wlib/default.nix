{
  inputs,
  ...
}: {
  umport = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport;

  colorscheme = "oldworld";
  polarity = "dark";

  wallpaperCategory = "boy";
  wallpaperIndex = "3";
  wallpaperProcessing = {
    level = 10;
    lum = 1.0;
    preserve = false;
  };
}
