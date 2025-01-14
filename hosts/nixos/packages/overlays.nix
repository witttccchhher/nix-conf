{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      niri_with_screenshots_fixes = super.niri.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          ./screenshot.patch
        ];
      });
    })
  ];
}
