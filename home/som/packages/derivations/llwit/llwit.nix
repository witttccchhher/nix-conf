{ lib, pkgs, python3Packages }: python3Packages.buildPythonApplication {
  name = "llwit";
  version = "0.1.0";
  pyproject = true;

  src = builtins.fetchGit {
    name = "llwit";
    url = "https://codeberg.org/somokill/llwit.git";
    ref = "master";
  };

  build-system = with python3Packages; [ poetry-core ];
  dependencies = with pkgs; [
    (callPackage ./hugchat.nix { })
    (callPackage ./rich.nix { })
  ];

  meta = with lib; {
    description = "TUI chat with llama";
    homepage = "https://codeberg.org/somokill/llwit";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [ somokill ];
    mainProgram = "llwit";
  };
}
