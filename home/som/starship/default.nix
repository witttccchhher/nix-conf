{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$nix_shell"
        "$python"
        "$golang"
        "$lua"
        "$nodejs"
        "$character"
      ];
    };
  };
}
