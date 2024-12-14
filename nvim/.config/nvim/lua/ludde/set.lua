vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.guicursor = ""

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8

vim.g.have_nerd_font = true

vim.opt.laststatus = 2
vim.opt.cmdheight = 2
vim.opt.showcmd = true
vim.opt.showmode = true

-- Makes nvim and OS share clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = false

vim.opt.fileencoding = "utf-8"

-- Quickly highlights the text you are copying
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
