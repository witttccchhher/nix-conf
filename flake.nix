{
  description = "Mystery place, full of flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    dooit.url = "github:dooit-org/dooit";
    dooit-extras.url = "github:dooit-org/dooit-extras";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "github:witttccchhher/wallpapers";
      flake = false;
    };
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };
  };

  outputs = { nixpkgs, nixpkgs-master, flake-parts, home-manager, stylix, nix-flatpak, nix-index-database, ... }@inputs: flake-parts.lib.mkFlake { inherit inputs; } {
    flake = let
      system = "x86_64-linux";
      pkgs-master = import nixpkgs-master { inherit system; };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system pkgs-master; };
        modules = [
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
        ];
      };

      homeConfigurations.som = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs pkgs-master; };
        modules = [
          stylix.homeManagerModules.stylix
          nix-index-database.hmModules.nix-index
          ./home.nix
        ];
      };
    };
    systems = [ "x86_64-linux" ];
  };
}
