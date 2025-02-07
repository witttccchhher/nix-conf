{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      on_force_close = "quit";
      simplified_ui = true;
    };
  };
}
