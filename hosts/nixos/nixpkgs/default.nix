{ ... }: {
  nixpkgs.config = {
    allowAliases = true;
    allowUnfree = true;
    allowBroken = true;
    allowInsecure = true;
    allowUnfreePredicate = true;
  };
}
