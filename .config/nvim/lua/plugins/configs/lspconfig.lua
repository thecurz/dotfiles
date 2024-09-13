local M = {}

M.on_attach = function(client, bufnr)
	--client.server_capabilities.documentFormattingProvider = false
	--client.server_capabilities.documentRangeFormattingProvider = false
end

--M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
