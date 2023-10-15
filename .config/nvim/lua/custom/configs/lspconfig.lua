local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local servers = {"html", "cssls", "clangd", "java"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.java_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"java"},
}
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes= {"python"},
})
-- TypeScript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- init_options = {
  --   preferences = {
  --     disableSuggestions = true,
  --   }
  -- }
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" }
}
