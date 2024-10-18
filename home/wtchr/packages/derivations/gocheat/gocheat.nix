{ pkgs, ... }: pkgs.buildGoModule rec {
  pname = "gocheat";
  version = "0.1.1";

  src = pkgs.fetchFromGitHub {
    owner = "Achno";
    repo = "${pname}";
    rev = "2b3d17dff08eeb97e28c2b9358a000af028478b2";
    hash = "sha256-9Xw1GVfqk0Se8pLx3vzqR+f9GgX4LDo/H3iq1fzoTRs=";
  };

  vendorHash = "sha256-CByVf4+WWUlFGJcqt7aq5bHXiLMjdHTKvv6PQYEbLqc=";
}
