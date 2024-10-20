local map = vim.keymap.set
local defaults = { noremap = true, silent = true }
map("n", "<leader>x", ":bd<cr>")
map("n", "<tab>", ":bn<cr>")
-- map("n", "<C-s>", ":w!<cr>")
map("n", "<leader>n", ":Pick explorer<cr>")
map("n", "<leader>f", ":Pick files<cr>")
-- map("n", "q", ":q<cr>")
map("n", ";", ":")
map("n", "<leader>t", ":bo term<cr>i")
map("n", "<leader>r", ":!python main.py<cr>")
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
