{
  pkgs,
  name,
  hash,
  style ? "rounded",
  fill ? "fill1_",
  color ? "#000000",
  ...
}: pkgs.stdenv.mkDerivation {
  pname = "google-material-symbol";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = "https://github.com/google/material-design-icons/blob/master/symbols/web/${name}/materialsymbols${style}/${name}_${fill}48px.svg";
    inherit hash;
  };

  phases = [ "buildPhase" ];
  buildPhase = ''
    cp $src $out
    chmod +rw $out

    sed -i -e 's/width="48"/width="48" fill="${color}"/' $out
  '';
}
