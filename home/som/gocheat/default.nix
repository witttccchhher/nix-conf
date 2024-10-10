{ config, ... }: {
  xdg.configFile."gocheat/config.json".text = with config.lib.stylix.colors; ''
{
  "items": [
    {
      "title": "Comment line: <leader> + /",
      "tag": "neovim"
    },
    {
      "title": "Close buffer: <leader> + x",
      "tag": "neovim"
    },
    {
      "title": "Next buffer: tab",
      "tag": "neovim"
    },
    {
      "title": "Save file: ctrl + s",
      "tag": "neovim"
    },
    {
      "title": "Open file explorer: <leader> + n",
      "tag": "neovim"
    },
    {
      "title": "Open file picker: <leader> + f",
      "tag": "neovim"
    },
    {
      "title": "Quit neovim: q",
      "tag": "neovim"
    },
    {
      "title": "Command mode: ;",
      "tag": "neovim"
    }
  ],
  "styles": {
    "subtext": "#${base05}",
    "accent": "#${base09}"
  }
}
  '';
}
