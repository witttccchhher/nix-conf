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
          hash = "sha256-4FwQxg3UUE0vFLsy+88Naal+YTCGfNMOtNhnG+W2HiU=";
        };
        cargoHash = "";

        env = prev.env // {
          RELEASE_VERSION = version;
        };
      });
    })
  ];
}
