vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.signcolumn = "yes"
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.guicursor = ""
vim.o.winborder = "rounded"
vim.o.swapfile = false
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

-- Quickly highlights the text you are copying
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Open neotree when nvim starts
vim.cmd([[autocmd VimEnter * Neotree show]])
