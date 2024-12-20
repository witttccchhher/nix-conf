{
  lib,
  stdenv,
  fetchFromGitHub,
  mpv,
  rofi,
  ueberzugpp,
  ...
}:

stdenv.mkDerivation rec {
  pname = "curd";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "Wraient";
    repo = "curd";
    rev = "v${version}";
    hash = "sha256-08ZALLar/VW8j1KQ4qFD4vbEVn0nfdvGHqL+wLeX6dk=";
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
