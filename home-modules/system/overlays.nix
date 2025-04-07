{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      zed-editor = super.zed-editor.overrideAttrs (prev: rec {
        version = "0.180.2";

        src = pkgs.fetchFromGitHub {
          owner = "zed-industries";
          repo = "zed";
          tag = "v${version}";
          hash = "";
        };
        cargoHash = "";

        env = prev.env // {
          RELEASE_VERSION = version;
        };
      });
    })
  ];
}
