{ w, ... }: {
  imports = w.umport {
    path = ./.;

    exclude = [
      ./default.nix
      ./custom
      ./programs/graphical/ags/agscher
    ];
  };
}
