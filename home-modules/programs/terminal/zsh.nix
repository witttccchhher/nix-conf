{ inputs, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = let
    in  {
      "x" = "exit";
      "c" = "clear";

      "ls" = "lla -l";
      "ll" = "lla";
      "tree" = "lla -t";

       ".." = "cd ..";
       "..." = "cd ../../";

      "flakeu" = "nix flake update --flake 'path:/home/witcher/nix'";

      "e" = "nvim";
      "fe" = "nvim $(fzf)";

      "y" = "yazi";
      "tte" = "trans ru:en -no-auto -no-theme";
      "ttr" = "trans en:ru -no-auto -no-theme";
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "regexp" "root" "line" ];
      styles = with config.lib.stylix.colors; {
        command = "fg=#${base07},bold";
        unknown-token = "fg=#${base08},bold";
        reserved-word = "fg=#${base07},bold";
        alias = "fg=#${base07},bold";
        builtin = "fg=#${base07},bold";
        function = "fg=#${base07},bold";
        commandseparator = "fg=#${base0D},bold";
        path = "fg=#${base0D},bold";
        path_pathseparator = "fg=#${base0D},bold";
        globbing = "fg=#${base0D},bold";
        command-substitution = "fg=#${base0D},bold";
        single-hyphen-option = "fg=#${base0D},bold";
        double-hyphen-option = "fg=#${base0D},bold";
        back-quoted-argument = "fg=#${base0A},bold";
        single-quoted-argument = "fg=#${base0A},bold";
        double-quoted-argument = "fg=#${base0A},bold";
        redirection = "fg=#${base0D},bold";
        comment = "fg=#${base04},bold";
        arg0 = "fg=#${base07},bold";
        default = "fg=#${base07},bold";
      };
    };
    plugins = with inputs; [
      {
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = fzf-tab;
      }
    ];
    autosuggestion = {
      enable = true;
      highlight = "fg=#${config.lib.stylix.colors.base04},bold";
    };
    history.size = 10000;
    initExtra = with config.lib.stylix.colors.withHashtag; ''
      # ZSH AUTO NOTIFY
      export AUTO_NOTIFY_THRESHOLD=90
      export AUTO_NOTIFY_TITLE=""%command" has just finished"
      export AUTO_NOTIFY_BODY="With exit code "%exit_code""
      export AUTO_NOTIFY_EXPIRE_TIME=3000
      export AUTO_NOTIFY_IGNORE=("y" "man" "sleep")

      # FZF TAB
      zstyle ":completion:*" menu no
      zstyle ":fzf-tab:*" fzf-flags \
        -e \
        -i \
        --algo=v1 \
        --no-mouse \
        -m \
        --height=20 \
        --reverse \
        --border=rounded \
        --no-scrollbar \
        --prompt="󰱼 " \
        --pointer="" \
        --color=fg:"${base06}",bg:"${base00}",preview-fg:"${base06}",preview-bg:"${base00}",hl:"${base08}",fg+:"${base00}",bg+:"${base0B}",gutter:"${base0B}",hl+:"${base00}",info:"${base0C}",border:"${base03}",prompt:"${base0C}",pointer:"${base00}",marker:"${base0E}",spinner:"${base0C}",header:"${base0C}"
      zstyle ":fzf-tab:*" fzf-bindings "space:accept"
      zstyle ":fzf-tab:*" accept-line enter

      # OPTIONS
      setopt automenu
      setopt nobeep

      # PROMPT
      # export nix_shell="%F{${base0D}}$name%f"
      # export user_symbol="%F{${base0C}} 󱄅  %f"
      # export dir_path="%F{${base02}}%K{${base02}}%F{${base07}}%~%{%k%}%F{${base02}}%f"
      # if [[ -n "$IN_NIX_SHELL" ]]; then
      #   export PROMPT="
      # %B$dir_path $nix_shell $user_symbol%b"
      # else
      #   export PROMPT="
      # %B$dir_path $user_symbol%b"
      # fi
    '';
  };
}
