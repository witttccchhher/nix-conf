{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      nwg-drawer-0_6_0 = super.nwg-drawer.overrideAttrs (old: rec {
        version = "0.6.0";
        src = pkgs.fetchFromGitHub {
          owner = "nwg-piotr";
          repo = "nwg-drawer";
          rev = "v${version}";
          hash = "";
        };
      });
    })
    (self: super: {
      chess-tui-1_6_0 = super.chess-tui.overrideAttrs (old: rec {
        version = "1.6.0";
        src = pkgs.fetchFromGitHub {
          owner = "thomas-mauran";
          repo = "chess-tui";
          rev = "${version}";
          hash = "sha256-AnlasOlA1KPQh4qCrpauSt71MMAoDBArc8AbUYo5k14=";
        };

        # cargoHash = "sha256-RUnT5b9pBcopTPT/1J48xZ4pfn3C0mIuYTDvgf3zvn0=";
      });
    })
  ];
}
