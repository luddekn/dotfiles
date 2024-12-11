vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.guicursor = ""

vim.opt.termguicolors = true

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.scrolloff = 10

-- Makes nvim and OS share clipboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.hlsearch = true

-- Quickly highlights the text you are copying
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
