{ pkgs, ... }: {
  nixpkgs.config = {
    allowAliases = true;
    allowUnfree = true;
    allowBroken = true;
  };
  allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "beat-prints"
  ];
}
