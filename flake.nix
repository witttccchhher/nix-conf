{
  description = "Mystery place, full of flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    # ignis.url = "git+https://github.com/ratson/ignis?submodules=1&ref=main&rev=7c4fac8b622d2d488012c2633d7ad76a71bdef57";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # ani-cli-ru.url = "path:home/som/packages/derivations/ani-cli";
    # gocheat.url = "path:home/som/packages/derivations/gocheat";
    # yetris.url = "path:home/som/packages/derivations/yetris";
    # ytui.url = "path:home/som/packages/derivations/ytui";
    # canvas.url = "path:home/som/packages/derivations/canvas";
    fabric-python.url = "github:Fabric-Development/fabric?ref=rewrite";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "git+https://codeberg.org/somokill/wallpapers?ref=main";
      flake = false;
    };
    thokr-ru = {
      url = "git+https://codeberg.org/somokill/thokr-russian?ref=main";
      flake = false;
    };
    firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    zsh-autopair = {
      url = "github:hlissner/zsh-autopair";
      flake = false;
    };
    fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };
    zsh-autosuggestions = {
      url = "github:zsh-users/zsh-autosuggestions";
      flake = false;
    };
    zsh-auto-notify = {
      url = "github:MichaelAquilina/zsh-auto-notify";
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
