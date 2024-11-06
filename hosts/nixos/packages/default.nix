{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    QT_WAYLAND_DECORATION = "adwaita";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    NIXPKGS_ALLOW_INSECURE = 1;
    COLORTERM = "truecolor";
    MICRO_TRUECOLOR = 1;
    FLAKE = "/home/som/nix";
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
    gnumake
    nodejs_22
    cargo
    yarn

    # Utilites
    dhcpcd
    usbutils
    unzip
    unrar
    fish
    iwd
    libnotify
    linux-firmware
    linuxHeaders
    lshw

    # Other
    home-manager
    python313
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
  ];
}
