vim.o.nu = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.signcolumn = "yes"
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
	callback = function()
		vim.hl.on_yank()
	end,
})
