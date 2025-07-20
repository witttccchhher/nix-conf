{ lib, config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings =
      let
        language = {
          format = "[via](bold ${config.lib.stylix.colors.withHashtag.base07}) [$symbol(\${version})]($style) ";
          version_format = "v\${raw}";
        };
      in
      with config.lib.stylix.colors.withHashtag;
      {
        format = lib.concatStrings [
          "$directory"
          "$git_branch"
          "$python"
          "$golang"
          "$lua"
          "$nodejs"
        ];
        right_format = lib.concatStrings [
          "$cmd_duration"
        ];
        add_newline = true;

        directory = {
          truncation_length = 1;
          truncate_to_repo = false;
          format = " [$path]($style) ";
          style = "bold fg:${base0E}";
          home_symbol = "witcher";
        };
        git_branch = {
          format = "[$symbol$branch]($style) ";
          symbol = " ";
          style = "bold fg:${base07}";
        };
        nix_shell = {
          format = "[via](bold ${base07}) [$symbol($name)]($style) ";
          symbol = "󱄅 ";
          style = "bold fg:${base0D}";
          heuristic = true;
        };
        python = language // {
          format = "[via](bold ${config.lib.stylix.colors.withHashtag.base07}) [$symbol(\${version})(\($virtualenv\))]($style) ";
          symbol = " ";
          style = "bold fg:${base0A}";
        };
        golang = language // {
          symbol = " ";
          style = "bold fg:${base0D}";
        };
        lua = language // {
          symbol = " ";
          style = "bold fg:${base0D}";
        };
        nodejs = language // {
          symbol = "󰛦 ";
          style = "bold fg:${base0C}";
        };
        cmd_duration = {
          min_time = 5000;
          format = "[$duration]($style)";
          style = "dimmed bold fg:${base0A}";
        };
      };
  };
}
