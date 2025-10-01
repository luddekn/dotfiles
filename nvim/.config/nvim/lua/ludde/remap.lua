-- Setting our leader key, being spacebar
vim.g.mapleader = " "
require("ludde.lazy")

-- Telescope keybinding
vim.keymap.set("n", "<leader>s", function()
    require("telescope.builtin").live_grep({
        prompt_title = "Search Tags",
        default_text = "@",
    })
end, { desc = "Search @tags in notes" })
--
-- Escape insert mode by pressing "jj"
vim.keymap.set("i", "jj", "<Esc>")

-- Setting keymaps for lsp
vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})

-- Keymaps for moving whole lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle netrw as a side panel
vim.keymap.set("n", "<leader><leader>", "<C-w><C-w>")
-- vim.keymap.set("n", "<leader>j", ":Neotree toggle<CR>")

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
