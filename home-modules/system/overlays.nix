{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      zed-editor = super.zed-editor.overrideAttrs (prev: rec {
        version = "0.180.2";
        
        src = prev.src // {
          tag = "v${version}";
          hash = "";
        };
        
        env = prev.env // {
          RELEASE_VERSION = version;
      });
    })
  ];
}
