local default_plugins = {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",        -- source for text in buffer
			"hrsh7th/cmp-path",          -- source for file system paths
			"L3MON4D3/LuaSnip",          -- snippet engine
			"saadparwaiz1/cmp_luasnip",  -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(),   -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							local entry = cmp.get_selected_entry()
							if not entry then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							end
							cmp.confirm()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
			})
		end,
	},

	{
		"nvim-lua/plenary.nvim",
	},
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{
				"<leader>A",
				function()
					require("harpoon"):list():add()
				end,
				desc = "harpoon file",
			},
			{
				"<leader>a",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon quick menu",
			},
			{
				"<leader>1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "harpoon to file 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "harpoon to file 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "harpoon to file 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "harpoon to file 4",
			},
			{
				"<leader>5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "harpoon to file 5",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },

		opts = function()
			return require("plugins.configs.mason")
		end,
		config = function(_, opts)
			-- dofile(vim.g.base46_cache .. "mason")
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")
			mason.setup({
				opts.ui,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d",
				},
			})
			-- custom nvchad cmd to install all mason binaries listed
			--vim.api.nvim_create_user_command("MasonInstallAll", function()
			--vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			--end, {})

			--vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local ensure_installed = {
				"gopls",
				"clangd",
				--"eslint-lsp",
				"tailwindcss",
				"tsserver",
				"jdtls",
			} -- not an option from mason.nvim
			mason_lspconfig.setup({
				ensure_installed = ensure_installed,
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			--require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig").setup()
		end,
	},
	{
		"Mofiqul/dracula.nvim",
	},
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken",    -- Only on MacOS or Linux
		opts = {
			debug = true,             -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.null-ls")
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	--{
	--"alexghergh/nvim-tmux-navigation",
	--},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			--dofile(vim.g.base46_cache .. "syntax")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		--event = "BufReadPost",
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			--for _, ext in ipairs(opts.extensions_list) do
			--telescope.load_extension(ext)
			--end
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
local config = require("plugins.configs.lazy_nvim")
require("lazy").setup(default_plugins, config)
