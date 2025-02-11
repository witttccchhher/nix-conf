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
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ez-configs = {
      url = "github:ehllie/ez-configs";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    stylix.url = "github:danth/stylix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    dooit.url = "github:dooit-org/dooit";
    dooit-extras.url = "github:dooit-org/dooit-extras";
    witpkgs.url = "github:witttccchhher/witpkgs";
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
    base16 = {
      url = "github:witttccchhher/base16";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      flake-parts,
      # home-manager,
      # stylix,
      # nix-flatpak,
      # nix-index-database,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.ez-configs.flakeModule
      ];
      systems = [
        "x86_64-linux"
      ];
      ezConfigs = {
        root = ./.;
        earlyModuleArgs = {
          inherit inputs;
          system = "x86_64-linux";
          w = import ./wlib { inherit inputs; };
        };
        # globalArgs = {
        #   inherit inputs;
        #   system = "x86_64-linux";
        #   w = import ./wlib { inherit inputs; };
        # };

        home = {
          users.som = {
            importDefault = true;
            standalone = {
              enable = true;
              pkgs = import nixpkgs { system = "x86_64-linux"; };
            };
          };
        };

        nixos = {
          hosts.nixos = {
            importDefault = true;
          };
        };
      };
      perSystem = { pkgs, lib, system, ... }: {
        _module.args.pkgs = import inputs.nixpkgs { inherit system; };
        formatter = pkgs.nixfmt-rfc-style;
      };
    };
}
