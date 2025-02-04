{ lib, config, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = with config.lib.stylix.colors.withHashtag; {
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
        truncate_to_repo = false;
        format = "  [$path]($style)";
        style = "bold fg:${base0E}";
        home_symbol = "som";
      };
    };
  };
}
