{
  programs.fzf = {
    enable = true;
    
    defaultCommand = "fd . --hidden";
    defaultOptions = [ "-e" "-i" "--info=hidden" ];
  };
}
