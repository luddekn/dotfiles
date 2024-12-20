-- Setting our leader key, being spacebar
vim.g.mapleader = " "

require("ludde.lazy")

local builtin = require("telescope.builtin")
-- Keybindings for telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- Escape insert mode by pressing "jj"
vim.keymap.set("i", "jj", "<Esc>")

-- Setting keymaps for lsp
vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})

-- Keymaps for moving whole lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle netrw as a side panel
vim.keymap.set("n", "<leader>s", ":Neotree toggle<CR>")

-- Deleting without copying it
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Pasting over something without loosing it from clipboard
vim.keymap.set("x", "<leader>P", '"_dP')

-- Copying to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Pasting from system clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
