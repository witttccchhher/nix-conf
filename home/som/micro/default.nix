{ pkgs, config, ... }: {
  programs.micro = {
  	enable = true;
  	package = pkgs.micro;
  	settings = {
  	  autosave = 15;
  	  autosu = true;
  	  basename = true;
  	  colorscheme = "chocolate-tc";
  	  diffgutter = true;
  	  matchbracestyle = "highlight";
  	  mkparents = true;
  	  savecursor = true;
  	  saveundo = true;
  	  softwrap = true;
  	  statusformatl = "$(filename)";
  	  statusformatr = "$(line):$(col)";
  	  sucmd = "doas";
  	  tabmovement = true;
  	  tabsize = 2;
  	  tabtospaces = true;
  	  wordwrap = true;
  	  
  	  autoclose = true;
  	  comment = true;
  	  linter = true;
  	  status = true;
  	  diff = true;
  	  snippets = true;
  	  quoter = true;
  	  lsp = true;

  	  "lsp.server" = "python=pyright,nix=nixd";
  	  "lsp.formatOnSave" = false;
  	  "lsp.tabcompletion" = true;
  	  "lsp.autocompleteDetails" = true;

  	  "ft:python" = {
  	  	tabsize = 4;
  	  	tabtospaces = false;
  	  };
  	};
  };

  xdg.configFile."micro/colorschemes/chocolate-tc.micro".text = with config.lib.stylix.colors; ''
color-link default "#${base05},#${base00}"
color-link comment "italic #${base04},#${base00}"
color-link symbol "#${base0A},#${base00}"
color-link constant "#${base0C},#${base00}"
color-link constant.string "#${base0B},#${base00}"
color-link constant.string.char "#${base0B},#${base00}"
color-link identifier "#${base0D},#${base00}"
color-link statement "#${base08},#${base00}"
color-link preproc "#${base08},235"
color-link type "#${base08},#${base00}"
color-link special "#${base0A},#${base00}"
color-link underlined "underline #${base0D},#${base00}"
color-link error "#${base08},#${base00}"
color-link todo "#${base05},#${base00}"
color-link hlsearch "#${base00},#${base0A}"
color-link diff-added "#${base0B}"
color-link diff-modified "#${base09}"
color-link diff-deleted "#${base08}"
color-link gutter-error "#${base08},#${base00}"
color-link gutter-warning "#${base0A},#${base00}"
color-link line-number "#${base03},#${base00}"
color-link current-line-number "#${base03},#${base00}"
color-link cursor-line "#${base02}"
color-link color-column "#${base02}"
color-link statusline "#${base05},#${base02}"
color-link tabbar "#${base05},#${base02}"
color-link match-brace "#${base0C},#${base00}"
color-link tab-error "#${base08}"
color-link trailingws "#${base08}"
  '';
}
