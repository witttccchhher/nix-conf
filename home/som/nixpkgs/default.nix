{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowAliases = true;
    permittedInsecurePackages = [
      "pulsar-1.122.0"
      "olm-3.2.16"
    ];
    allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "beat-prints"
    ];
  };
}
