{
  description = "Mystery place, full of flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    ignis.url = "github:linkfrg/ignis";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    ani-cli-ru.url = "path:home/som/packages/derivations/ani-cli";
    gocheat.url = "path:home/som/packages/derivations/gocheat";
    yetris.url = "path:home/som/packages/derivations/yetris";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "https://codeberg.org/somokill/wallpapers";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, stylix, nix-flatpak, ... }@inputs: 
    let
      system = "x86_64-linux";
    in {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      modules = [
        stylix.nixosModules.stylix
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
      ];
    };

    homeConfigurations.som = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        stylix.homeManagerModules.stylix
        ./home.nix
      ];
    };
  };
}
