{ ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cf68b9ba-d7f0-477d-837a-c51082fa4746";
    fsType = "ext4";
  };
  swapDevices = [
    { device = "/dev/disk/by-uuid/b72841c5-7d1f-42ee-98cc-3f7f98fb33e8"; }
  ];

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}
