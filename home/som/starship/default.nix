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
      right_format = lib.concatStrings [
        "$cmd_duration"
      ];
      add_newline = true;

      directory = {
        truncation_length	= 1;
      };
    };
  };
}
