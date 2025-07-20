{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      commit-mono
      dejavu_fonts
      (google-fonts.override { fonts = [ "Inter" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Commit Mono" ];
        sansSerif = [ "Inter" ];
        serif = [ "Inter" ];
      };
    };

    enableDefaultPackages = true;
    fontDir.enable = true;
  };
}
