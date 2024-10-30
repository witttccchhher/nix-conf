{ pkgs, ... }: pkgs.stdenv.mkDerivation rec {
  pname = "canvas";
  version = "3.0";

  src = pkgs.fetchFromGitHub {
    owner = "adi1090x";
    repo = "${pname}";
    rev = "b4b1e3456d86db98052bd7735ae3c0a8799b1061";
    hash = "sha256-yyZjwU3n1UJfVQ05if3oKBNKfjURmvfHFe2zC91Zu8g=";
  };

  buildInputs = with pkgs; [ imagemagick feh xcolor xorg.xrandr ];
  nativeBuildInputs = with pkgs; [ imagemagick feh xcolor xorg.xrandr ];

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/canvas $out/bin
    chmod +x $out/bin/canvas
  '';
}
