{ ... }: {
  nixpkgs.overlays = [
    (self: super: {
      nwg-drawer6 = super.nwg-drawer.overrideAttrs (old: {
        version = "0.6.0";
        src = old.src // {
          hash = "";
        };
      });
    })
  ];
}
