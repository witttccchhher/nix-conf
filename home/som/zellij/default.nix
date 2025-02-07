{ config, ... }: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      on_force_close = "quit";
      simplified_ui = true;
      default_shell = "zsh";
      copy_on_select = false;
      ui.pane_frames.rounded_corners = true;
    };
  };
}
