{
  description = "My Awesome Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, astal, ags }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          astal.packages.${system}.default
          (ags.packages.${system}.default.override {
            extraPackages = with ags.packages.${system}; [
              apps
              battery
              bluetooth
              network
              notifd
              powerprofiles
              wireplumber
            ];
          })
        ];
      };
    };
  };
}
