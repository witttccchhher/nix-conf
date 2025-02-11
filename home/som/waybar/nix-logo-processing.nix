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

    sed -i -e "s/#699ad7/${firstColor}/" $out/${filename}
    sed -i -e "s/#7eb1dd/${firstColor}/" $out/${filename}
    sed -i -e "s/#7ebae4/${firstColor}/" $out/${filename}

    sed -i -e "s/#415e9a/${secondColor}/" $out/${filename}
    sed -i -e "s/#4a6baf/${secondColor}/" $out/${filename}
    sed -i -e "s/#5277c3/${secondColor}/" $out/${filename}
  '';
}
