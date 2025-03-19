{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    theme = {
      package = lib.mkForce pkgs.colloid-gtk-theme;
      name = lib.mkForce "Colloid";
    };
    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid";
    };
  };
}
