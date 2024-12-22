{ inputs, pkgs, ... }: {
  imports = inputs.nypkgs.legacyPackages.${pkgs.system}.lib.umport {
    path = ./.;

    include = [
      ./packages/default.nix
    ];
    exclude = [
      ./default.nix
      ./packages
      ./stylix/themes
      ./yazi/yazi.nix
    ];
  };
}
