{
  lib,
  stdenv,
  fetchFromGitHub,
  srcOnly,
  kernel,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "bluetooth-5.15";
  version = "1.0.20240711";

  src = fetchFromGitHub {
    owner = "jeremyb31";
    repo = "bluetooth-5.15";
    rev = "b4c95d8dce1f8073a8b512b9aed160959bea9331";
    hash = "";
  };

  sourceRoot = "${finalAttrs.src.name}/src";
  hardeningDisable = [ "pic" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  buildFlags = [
    "apply-patches"
    "module"
  ];

  makeFlags =
    kernel.makeFlags
    ++ [ "KERNELDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" ]
    ++ lib.optional (lib.versionAtLeast kernel.version "5.6") "KERNEL_SOURCE_DIR=${srcOnly kernel}";

  enableParallelBuilding = true;

  installFlags = [
    "DEPMOD=true"
    "INSTALL_MOD_PATH=${placeholder "out"}"
  ];

  passthru.updateScript = nix-update-script { };
})
