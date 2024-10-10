{ lib, stdenv, pkgs, ... }: stdenv.mkDerivation rec {
  pname = "yetris";
  version = "2.3.0";

  src = pkgs.fetchFromGitHub {
    owner = "alexdantas";
    repo = "${pname}";
    rev = "cf3fee6c2f1daf5b2c35468b9e211c2e87530a4f";
    hash = "sha256-YUsUdC29nqUgf/PBLZYXxkoicxj4hU+0crRs5/+f7Ow=";
  };

  buildInputs = with pkgs; [ ncurses5 ];
  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Terminal TUI tetris";
    homepage = "https://github.com/alexdantas/yetris";
    changelog = "https://github.com/alexdantas/yetris/releases/tag/v${version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ somokill ];
    main_program = "yetris";
  };
}
