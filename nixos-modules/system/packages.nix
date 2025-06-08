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
    broadcom-bt-firmware
    linux-firmware
    linuxHeaders
    home-manager
  ];
}
