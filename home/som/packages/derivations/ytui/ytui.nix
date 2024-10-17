{ pkgs, ... }: pkgs.buildGoModule rec {
  pname = "ytui";
  version = "0.1.8";

  src = pkgs.fetchFromGitHub {
    owner = "Banh-Canh";
    repo = "${pname}";
    rev = "87df5d69323bbabd02e591f947adf345e9c3567e";
    hash = "";
  };

  vendorHash = "";
}
