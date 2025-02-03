{ pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      spotify = super.spotify.overrideAttrs (old: let
        rev = "79";
        version = "1.2.45.454.gc16ec9f6";
      in rec {
        inherit version;
        src = pkgs.fetchurl {
          name = "spotify-${version}-${rev}.snap";
          url = "https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_${rev}.snap";
          hash = "sha512-F1Npz/oKCsMKaQx2M5dm1dhWhaSlt8422tpRWnwuk2yjwLWrOYDY2uKYph8YFXfOdS3mV6u5yVlzgFdDqAFmCQ==";
        };
      });
    })
  ];
}
