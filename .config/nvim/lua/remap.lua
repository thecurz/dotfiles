-- Basic remaps
vim.keymap.set("i", "<Tab>", [[  ]])
vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
-- Copilot

--let g:copilot_no_tab_map = v:true
--let g:copilot_assume_mapped = v:true

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.keymap.set("i", "<C-l>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"]())
end, { noremap = false, silent = true })

-- switch between windows
--vim.keymap.set("n", "<C-h>", "<C-w>h")
--vim.keymap.set("n", "<C-l>", "<C-w>l")
--vim.keymap.set("n", "<C-j>", "<C-w>j")
--vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Comments
--vim.keymap.set("n", "<leader>/", function()
--require("Comment.api").toggle.linewise.current()
--end, { noremap = true, silent = true })

-- Copy and paste
vim.keymap.set("v", "<C-c>", function()
	vim.cmd([[silent! normal! "+y]])
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>", function()
	vim.cmd([[silent! normal! "+p]])
end, { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
vim.keymap.set(
	"n",
	"<leader>fa",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
	{ desc = "Find all" }
)
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" })
vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

vim.keymap.set("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })

vim.keymap.set("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Nvchad themes" })

vim.keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "Telescope bookmarks" })

vim.keymap.set("n", "<leader>ps", function()
	local builtin = require("telescope.builtin")
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { noremap = true, silent = true, desc = "Fuzzy Finder" })
