{ inputs, ... }: {
  imports = inputs.nypkgs.legacyPackages."x86_64-linux".lib.umport {
    path = ./.;

    exclude = [
      ./default.nix
      ./stylix/themes
    ];
  };
}
