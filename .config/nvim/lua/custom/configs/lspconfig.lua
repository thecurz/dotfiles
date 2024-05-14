local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require("lspconfig.util")
local lspconfig = require("lspconfig")
local servers = {"html", "cssls", "clangd"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        -- unreachable = false,
      },
    }
  }
})
lspconfig.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"jdtls"},
  filetypes = {"java"},
  root_dir = util.root_pattern("pom.xml", ".git"),
})
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes= {"python"},
})
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" }
}
