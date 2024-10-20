require("configs.options")
require("configs.mappings")

local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require("configs.hues")
require("mini.pairs").setup()
require("configs.statusline")
require("configs.base16")
require("configs.comments")
require("configs.lsp")
require("configs.icons")
require("configs.tabline")
require("mini.extra").setup()
require("mini.pick").setup()
require("configs.notifyes")
require("plugins.init")
