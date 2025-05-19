{ ... }: {
  programs = {
    nix-ld.enable = true;
    adb.enable = true;
    command-not-found.enable = false;
  };
}
