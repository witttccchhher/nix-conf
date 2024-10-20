local lspconfig = require("lspconfig")

require('lsp-format').setup()
local function on_attach(client, bufnr)
  MiniCompletion.completefunc_lsp()
  require('lsp-format').on_attach(client, bufnr)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

servers = { "nixd", "html", "cssls", "ts_ls", "pyright" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
end
