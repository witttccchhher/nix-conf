{ inputs, ... }: {
  imports = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport {
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
