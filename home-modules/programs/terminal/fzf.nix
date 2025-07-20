{ ... }:
{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd . --hidden";
    defaultOptions = [
      "-e"
      "-i"
      "--algo=v1"
      "--no-mouse"
      "-m"
      "--height=20"
      "--reverse"
      "--border=rounded"
      "--no-scrollbar"
      "--prompt='󰱼 '"
      "--pointer=''"
    ];
  };
}
