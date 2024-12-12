-- Setting our leader key, being spacebar
vim.g.mapleader = " "

require("ludde.lazy")

local builtin = require("telescope.builtin")

--vim.keymap.set("n", "<leader>8", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", ":25Lex<CR>")

-- Keybindings for telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- Escape insert mode by pressing "jj"
vim.keymap.set("i", "jj", "<Esc>")

-- Clears the search filter when in normal mode
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<CR>")

-- Disabling arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move left'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move right'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move up'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move down'<CR>")

-- Setting keymaps for lsp
vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>p", vim.lsp.buf.code_action, {})

-- Auto close
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "/*", "/**/<left>")

-- Visual map 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
