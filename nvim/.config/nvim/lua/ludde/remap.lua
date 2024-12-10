-- Setting our leader key, being spacebar
vim.g.mapleader = " "

require("ludde.lazy")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>8", vim.cmd.Ex)

-- Keybindings for telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- Toggling our neo-tree
vim.keymap.set("n", "<leader>s", ":Neotree filesystem reveal left<CR>")

-- Escape insert mode by pressing "jj"
vim.keymap.set("i", "jj", "<Esc>")
