local M = {}
M.setup = function()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local opts = { buffer = ev.buf, silent = true }
			--client.server_capabilities.documentFormattingProvider = false
			--client.server_capabilities.documentRangeFormattingProvider = false
			opts.desc = "LSP formatting"
			vim.keymap.set("n", "<leader>fm", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
			opts.desc = "LSP declaration"
			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)

			opts.desc = "LSP definition"
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)

			opts.desc = "LSP hover"
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)

			opts.desc = "LSP implementation"
			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, opts)

			opts.desc = "LSP signature help"
			vim.keymap.set("n", "<leader>ls", function()
				vim.lsp.buf.signature_help()
			end, opts)

			opts.desc = "Open Copilot panel"
			vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", opts)

			opts.desc = "LSP definition type"
			vim.keymap.set("n", "<leader>D", function()
				vim.lsp.buf.type_definition()
			end, opts)

			opts.desc = "LSP rename"
			vim.keymap.set("n", "<leader>ra", function()
				require("nvchad.renamer").open()
			end, opts)

			opts.desc = "LSP code action"
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)

			opts.desc = "LSP references"
			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, opts)

			opts.desc = "Floating diagnostic"
			vim.keymap.set("n", "<leader>f", function()
				vim.diagnostic.open_float({ border = "rounded" })
			end, opts)

			opts.desc = "Goto prev"
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end, opts)

			opts.desc = "Goto next"
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end, opts)

			opts.desc = "Diagnostic setloclist"
			vim.keymap.set("n", "<leader>q", function()
				vim.diagnostic.setloclist()
			end, opts)

			opts.desc = "Add workspace folder"
			vim.keymap.set("n", "<leader>wa", function()
				vim.lsp.buf.add_workspace_folder()
			end, opts)

			opts.desc = "Remove workspace folder"
			vim.keymap.set("n", "<leader>wr", function()
				vim.lsp.buf.remove_workspace_folder()
			end, opts)

			opts.desc = "List workspace folders"
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)

			opts.desc = "LSP code action"
			vim.keymap.set("v", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
		end,
	})
	local capabilities = cmp_nvim_lsp.default_capabilities()
	local util = require("lspconfig.util")
	local servers = { "html", "cssls", "clangd" }
	--for _, lsp in ipairs(servers) do
	--lspconfig[lsp].setup({
	--	on_attach = on_attach,
	--		capabilities = capabilities,
	--})
	--end
	--lspconfig.tailwindcss.setup({
	--on_attach = on_attach,
	--capabilities = capabilities,
	--})
	--lspconfig.gopls.setup({
	--on_attach = on_attach,
	--capabilities = capabilities,
	--cmd = { "gopls" },
	--filetypes = { "go", "gomod", "gowork", "gotmpl" },
	--root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	--settings = {
	--gopls = {
	--completeUnimported = true,
	--usePlaceholders = true,
	--analyses = {
	--unusedparams = true,
	---- unreachable = false,
	--},
	--},
	--},
	--})
	--lspconfig.jdtls.setup({
	--on_attach = on_attach,
	--capabilities = capabilities,
	--cmd = { "jdtls" },
	--filetypes = { "java" },
	--root_dir = util.root_pattern("pom.xml", ".git"),
	--})
	--lspconfig.clangd.setup({
	--on_attach = function(client, bufnr)
	--client.server_capabilities.signatureHelpProvider = false
	--on_attach(client, bufnr)
	--end,
	--capabilities = capabilities,
	--})
	--lspconfig.pyright.setup({
	--on_attach = on_attach,
	--capabilities = capabilities,
	--filetypes = { "python" },
	--})
	--lspconfig.tsserver.setup({
	--on_attach = on_attach,
	--capabilities = capabilities,
	--init_options = {
	--preferences = {
	--disableSuggestions = true,
	--},
	--},
	---- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	---- cmd = { "typescript-language-server", "--stdio" }
	--})

	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
			})
		end,
		["clangd"] = function()
			lspconfig["clangd"].setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
				end,
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--pch-storage=memory",
					"--clang-tidy",
					"--header-insertion=never",
				},
			})
		end,
	})
end
return M
