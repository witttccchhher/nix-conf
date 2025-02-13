{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    QT_WAYLAND_DECORATION = "adwaita";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    NIXPKGS_ALLOW_INSECURE = 1;
    COLORTERM = "truecolor";
    FLAKE = "/home/som/nix";
    GOPATH = "$HOME/go";
    MESA_GL_VERSION_OVERRIDE = "3.3";
    MESA_GLSL_VERSION_OVERRIDE = "330";
  };
  environment.systemPackages = with pkgs; [
    alsa-lib
    alsa-utils
    alsa-tools
    alsa-plugins
    alsa-firmware
    ffmpeg_7
    libpng12
    gcc
    clang
    gnumake
    nodejs_22
    cargo
    yarn
    dhcpcd
    bluez
    bluez-tools
    bluez-alsa
    broadcom-bt-firmware
    usbutils
    gvfs
    unzip
    unrar
    iwd
    libnotify
    linux-firmware
    linuxHeaders
    python312Packages.launchpadlib
    gnupg
    lshw
    home-manager
    python313
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
    networkmanager-l2tp
  ];
}
