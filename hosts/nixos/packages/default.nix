{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    QT_WAYLAND_DECORATION = "adwaita";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    NIXPKGS_ALLOW_INSECURE = 1;
    COLORTERM = "truecolor";
    MICRO_TRUECOLOR = 1;
    FLAKE = "/home/som/nix";
    GOPATH = "$HOME/go";
    MESA_GL_VERSION_OVERRIDE = "3.3";
    MESA_GLSL_VERSION_OVERRIDE = "330";
  };
  environment.systemPackages = with pkgs; [
    # Media
    alsa-lib
    alsa-utils
    alsa-tools
    alsa-plugins
    alsa-firmware
    ffmpeg_7
    libpng12

    # Code
    gcc
    clang
    gnumake
    nodejs_22
    cargo
    yarn

    # Utilites
    dhcpcd
    bluez
    bluez-tools
    bluez-alsa
    broadcom-bt-firmware
    usbutils
    gvfs
    unzip
    unrar
    fish
    iwd
    libnotify
    linux-firmware
    linuxHeaders
    python312Packages.launchpadlib
    python311Packages.tkinter
    gnupg
    lshw

    # Other
    home-manager
    python313
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
    networkmanager-l2tp
  ];
}
