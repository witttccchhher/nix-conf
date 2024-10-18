{ config, ... }: {
  xdg.configFile."gocheat/config.json".text = with config.lib.stylix.colors; ''
{
  "items": [
    {
      "title": "",
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
