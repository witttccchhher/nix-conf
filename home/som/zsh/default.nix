{ inputs, config, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      "ls" = "lsd -a";
      "ll" = "lsd -a -l";

      "ns" = "nix-shell --run zsh";
      "flakeu" = "nix flake update ~/nix/";

      "e" = "nvim";
      "fe" = "nvim $(fzf)";

      "y" = "yazi";
      "fetch" = "nitch";
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "cursor" ];
      styles = {
        command = "fg=magenta,bold";
        unknown-token = "fg=red,bold";
        reserved-word = "fg=magenta,bold";
        alias = "fg=magenta,bold";
        builtin = "fg=magenta,bold";
        function = "fg=magenta,bold";
        commandseparator = "fg=blue,bold";
        path = "fg=none,bold";
        path_pathseparator = "fg=blue,bold";
        globbing = "fg=blue,bold";
        command-substitution = "fg=#d08b65,bold";
        single-hyphen-option = "fg=none,bold";
        double-hyphen-option = "fg=none,bold";
        back-quoted-argument = "fg=yellow,bold";
        single-quoted-argument = "fg=yellow,bold";
        double-quoted-argument = "fg=yellow,bold";
        redirection = "fg=#d08b65,bold";
        arg0 = "fg=none,bold";
        default = "fg=none,bold";
      };
    };
    plugins = with inputs; [
      {
        name = "zsh-autopair";
        file = "autopair.zsh";
        src = zsh-autopair;
      }
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.plugin.zsh";
        src = zsh-autosuggestions;
      }
      {
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = fzf-tab;
      }
      {
        name = "zsh-auto-notify";
        file = "auto-notify.plugin.zsh";
        src = zsh-auto-notify;
      }
    ];
    initExtra = with config.lib.stylix.colors; ''
      export AUTO_NOTIFY_THRESHOLD=60
      export AUTO_NOTIFY_TITLE="Hey! "%command" has just finished"

      export user_symbol="%F{#${base05}}󱄅  %f"
      export dir_path="%F{#${base03}}%K{#${base03}}%F{#${base05}}%d%{%k%}%F{#${base03}}%f"
      export PROMPT="
      %B$dir_path $user_symbol%b"
    '';
  };
}
