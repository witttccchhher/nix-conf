{ w }: {
  imports = w.umport {
    path = ./.;

    exclude = [
      ./default.nix
      ./custom
      ./programs/graphical/waybar/google-icons.nix
      ./programs/graphical/waybar/nix-logo-processing.nix
    ];
  };
}
