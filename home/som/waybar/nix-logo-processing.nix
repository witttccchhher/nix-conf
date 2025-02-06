{
  firstColor,
  secondColor,
  sourceDir,
  filename,
  pkgs,
  ...
}: pkgs.stdenv.mkDerivation {
  pname = "nix-logo-processing";
  version = "1.0.0";

  src = sourceDir;

  phases = [ "buildPhase" ];
  buildPhase = ''
    mkdir -p $out
    cp $src/${filename} $out
    chmod +rw $out/${filename}
    ${pkgs.imagemagick}/bin/magick $out/${filename} -fuzz 15% -fill "${firstColor}" -opaque "#5277c3" $out/${filename}
    ${pkgs.imagemagick}/bin/magick $out/${filename} -fuzz 15% -fill "${secondColor}" -opaque "#7ebae4" $out/${filename}
  '';
}
