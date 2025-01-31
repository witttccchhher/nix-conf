{ pkgs, ... }: {
  nixpkgs.overlays = [
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
