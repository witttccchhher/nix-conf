{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      nwg-drawer-0_6_0 = super.nwg-drawer.overrideAttrs (old: rec {
        version = "0.6.0";
        src = pkgs.fetchFromGitHub {
          owner = "nwg-piotr";
          repo = "nwg-drawer";
          rev = "${version}";
          hash = "sha256-TYGDAVKw89rwaXsElUXUskvruWViAbiDI6pwjrbtgjE=";
        };

        vendorHash = "sha256-Q+2CXpPvfy6QYjP+AZeJL/l00/Z+C56c+FfGcyIdQ4M=";
      });
    })
    (self: super: {
      swayfx-unwrapped = super.swayfx-unwrapped.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          (pkgs.fetchpatch2 {
            url = "https://github.com/swaywm/sway/pull/8470.patch?full_index=1";
            hash = "sha256-UTZ2DNEsGi5RYrgZThHkYz3AnnIl/KxieinA1WUZRq4=";
          })
        ];
      });
    })
  ];
}
