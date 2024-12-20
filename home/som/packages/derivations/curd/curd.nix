{
  lib,
  stdenv,
  fetchurl,
  mpv,
  rofi,
  ueberzugpp,
  ...
}:

stdenv.mkDerivation rec {
  pname = "curd";
  version = "1.0.4";

  src = fetchurl {
    url = "https://github.com/Wraient/curd/releases/download/v${version}/curd";
    hash = "sha256-dg9CSMj2vEpmPAE1y0koZUmZw107Anw4JDH6niSGNz4=";
  };

  nativeBuildInputs = [
    mpv
    rofi
    ueberzugpp
  ];

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/curd $out/bin/curd
    chmod +x $out/bin/curd
  '';

  meta = {
    description = "Watch anime in cli with Anilist Integration and Discord RPC";
    homepage = "https://github.com/Wraient/curd/releases/latest/download/curd";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ "witttccchhher" ];
    mainProgram = "curd";
    platforms = lib.platforms.all;
  };
}
