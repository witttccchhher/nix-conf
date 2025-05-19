{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    QT_WAYLAND_DECORATION = "adwaita";
    QT_QPA_PLATFORMTHEME = "gtk3";
    COLORTERM = "truecolor";
    FLAKE = "/home/witcher/nix";
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };
  environment.systemPackages = with pkgs; [
    ffmpeg_7
    libpng12
    gcc
    clang
    gnumake
    cargo
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
    gnupg
    lshw
    home-manager
    python313
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
    networkmanager-l2tp
    wineWowPackages.full
    wineWowPackages.waylandFull
    winetricks
  ];
}
