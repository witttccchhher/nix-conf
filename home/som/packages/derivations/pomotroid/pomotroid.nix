{
  lib,
  stdenv,
  fetchurl,
  pkgs,
  ...
}:
let
  desktopItem = pkgs.makeDesktopItem {
    name = "Pomotroid";
    exec = "@out@/bin/pomotroid";
    icon = "view-calendar-time-spent";
    desktopName = "Pomotroid";
    genericName = "Pomodoro timer";
    categories = [ "Utility" ];
    startupNotify = false;
  };
in
stdenv.mkDerivation rec {
  pname = "pomotroid";
  version = "0.13.0";

  src = fetchurl {
    url = "https://github.com/Splode/${pname}/releases/download/v${version}/${pname}-${version}-linux.tar.gz";
    hash = "sha256-AwpVnvwWQd/cgmZvtr5NprnLyeXz6ym4Fywc808tcSc=";
  };

  phases = [ "installPhase" ];
  buildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin $out/src
    tar -xf $src -C $out/src
    cp -r $out/src/${pname}-${version}-linux/* $out/bin
    chmod +rwx $out/bin/*
    wrapProgram $out/bin/pomotroid \
      --add-flags "--no-sandbox" \
      --prefix LD_LIBRARY_PATH : ${
        with pkgs;
        lib.makeLibraryPath [
          alsa-lib
          at-spi2-atk
          cairo
          cups
          dbus
          expat
          gdk-pixbuf
          glib
          gtk3
          libdrm
          mesa
          nspr
          nss
          pango
          xorg.libX11
          xorg.libXScrnSaver
          xorg.libXcomposite
          xorg.libXcursor
          xorg.libXdamage
          xorg.libXext
          xorg.libXfixes
          xorg.libXi
          xorg.libXrandr
          xorg.libXrender
          xorg.libXtst
          xorg.libxcb
        ]
      }
    install -D ${desktopItem}/share/applications/Pomotroid.desktop $out/share/applications/pomotroid.desktop
  '';

  meta = with lib; {
    description = "Tomato: Simple and visually-pleasing Pomodoro timer";
    homepage = "https://github.com/Splode/pomotroid";
    changelog = "https://github.com/Splode/pomotroid/blob/master/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ somokill ];
    mainProgram = "pomotroid";
    platforms = platforms.all;
  };
}
