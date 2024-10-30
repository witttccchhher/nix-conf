{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "pulsar-1.122.0"
    ];
  };
}
