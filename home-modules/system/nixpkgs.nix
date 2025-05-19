{ ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowAliases = true;
    allowInsecure = true;
    allowUnfreePredicate = true;
    permittedInsecurePackages = [
      "ventoy-1.1.05"
    ];
  };
}
