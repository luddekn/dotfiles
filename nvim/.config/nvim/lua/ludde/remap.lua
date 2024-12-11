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

-- Clears the search filter when in normal mode
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<CR>")

-- Disabling arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move left'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move right'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move up'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move down'<CR>")

