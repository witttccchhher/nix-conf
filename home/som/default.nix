{ inputs, pkgs, ... }: {
  imports = inputs.nypkgs.legacyPackages.${pkgs.system}.lib.umport {
    path = ./.;

    include = [];
    exclude = [
      ./default.nix
    ];
  };
}
