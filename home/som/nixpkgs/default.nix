{ ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowAliases = true;
    allowInsecure = true;
    allowUnfreePredicate = true;
  };
}
