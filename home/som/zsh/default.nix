{ inputs, config, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      "x" = "exit";
      "c" = "clear";

      ";q" = "exit";
      ";wq" = "exit";

      "ls" = "lsd -a";
      "ll" = "lsd -a -l";
      "tree" = "lsd -a --tree";

       ".." = "cd ..";
       "..." = "cd ../../";

      "ns" = "nix-shell --run zsh";
      "flakeu" = "nix flake update --flake 'path:/home/som/nix/'";
      "nixgitu" = "cd ~/nix/ && git add * && git commit -m 'Some changes' && cd";

      "e" = "nvim";
      "fe" = "nvim $(fzf)";
      "pe" = "nvim ~/nix/home/som/packages/default.nix";

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
        commandseparator = "fg=#${base0C},bold";
        path = "fg=#${base0C},bold";
        path_pathseparator = "fg=#${base0D},bold";
        globbing = "fg=#${base0C},bold";
        command-substitution = "fg=#${base0A},bold";
        single-hyphen-option = "fg=#${base0F},bold";
        double-hyphen-option = "fg=#${base0F},bold";
        back-quoted-argument = "fg=#${base09},bold";
        single-quoted-argument = "fg=#${base09},bold";
        double-quoted-argument = "fg=#${base09},bold";
        redirection = "fg=#${base0A},bold";
        comment = "fg=#${base04},bold";
        arg0 = "fg=#${base07},bold";
        default = "fg=#${base07},bold";
      };
      patterns = with config.lib.stylix.colors; {
        "sudo" = "fg=${base00},bold,bg=${base08}";
      };
    };
    plugins = with inputs; [
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
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = zsh-nix-shell;
      }
    ];
    autosuggestion = {
      enable = true;
      highlight = "fg=#${config.lib.stylix.colors.base04},bold";
    };
    history.size = 10000;
    initExtra = with config.lib.stylix.colors.withHashtag; ''
      # ZSH AUTO NOTIFY
      export AUTO_NOTIFY_THRESHOLD=60
      export AUTO_NOTIFY_TITLE="Hey! "%command" has just finished"

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
        --preview="preview.sh {}" \
        --color=fg:"${base07}",bg:"${base00}",preview-fg:"${base07}",preview-bg:"${base00}",hl:"${base08}",fg+:"${base00}",bg+:"${base0D}",gutter:"${base03}",hl+:"${base00}",info:"${base0C}",border:"${base04}",prompt:"${base0C}",pointer:"${base00}",marker:"${base0E}",spinner:"${base0C}",header:"${base0C}"
      zstyle ":fzf-tab:*" fzf-bindings "space:accept"
      zstyle ":fzf-tab:*" accept-line enter

      # OPTIONS
      setopt automenu
      setopt nobeep
      source ${./autosrc.zsh}

      # PROMPT
      export nix_shell="%F{${base0D}}$name%f"
      export user_symbol="%F{${base0D}}󱄅  %f"
      export dir_path="%F{#2c2c2c}%K{#2c2c2c}%F{${base07}}%d%{%k%}%F{#2c2c2c}%f"
      export PROMPT="
      %B$dir_path $nix_shell $user_symbol%b"
    '';
  };
}
