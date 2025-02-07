{
  name,
  hash,
  style ? "rounded",
  fill ? "fill1_",
  color ? "#000000",
  pkgs,
  ...
}: pkgs.stdenv.mkDerivation {
  pname = "google-material-symbol";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/google/material-design-icons/refs/heads/master/symbols/web/${name}/materialsymbols${style}/${name}_${fill}48px.svg";
    inherit hash;
  };

  phases = [ "buildPhase" ];
  buildPhase = ''
    mkdir -p $out
    cp $src $out/out.svg
    chmod +rw $out/out.svg

    sed -i -e 's/width="48"/width="48" fill="${color}"/' $out/out.svg
  '';
}
