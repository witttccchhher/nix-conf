{ pkgs }: pkgs.python3Packages.buildPythonApplication rec {
  pname = "fabric";
  version = "1.0.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Fabric-Development";
    repo = "${pname}";
    rev = "b40263bd15db9a7ad7fe7c764dd409aaa615622b";
    hash = "sha256-8HrzieeOj9dmRNXXV1AA6jV7COVYPnD7dK9npPxtER4=";
  };

  build-system = [ pkgs.python3Packages.setuptools ];

  dependencies = [
    pkgs.python3Packages.click
    pkgs.python3Packages.pycairo
    pkgs.python3Packages.pygobject3
    pkgs.python3Packages.loguru
    pkgs.python3Packages.psutil
  ];
}
