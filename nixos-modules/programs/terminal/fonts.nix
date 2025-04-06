{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      cascadia-code
      dejavu_fonts
      (google-fonts.override { fonts = [ "Inter" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Cascadia Mono" ];
        sansSerif = [ "Inter" ];
        serif = [ "Inter" ];
      };
    };

    enableDefaultPackages = true;
    fontDir.enable = true;
  };
}
