-- Setting our leader key, being spacebar
vim.g.mapleader = " "
require("ludde.lazy")

-- Telescope keybinding
vim.keymap.set("n", "<leader>s", function()
    -- Live grep needs "ripgrep" installed
    require("telescope.builtin").live_grep({
        default_text = "@"
    })
end)

-- Escape insert mode by pressing "jj"
vim.keymap.set("i", "jj", "<Esc>")

-- Setting keymaps for lsp
vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})

-- Keymaps for moving whole lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle netrw as a side panel
vim.keymap.set("n", "<leader>j", "<C-w><C-w>")
vim.keymap.set("n", "<leader><leader>", ":Neotree toggle<CR>")

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

-- Jumping to start and end of the line
vim.keymap.set("n", "<C-h>", '0')
vim.keymap.set("n", "<C-l>", '$')

-- Opening markdown links in browser
vim.keymap.set("n", "<leader>o", function()
    vim.cmd("normal! yi(")
    local url = vim.fn.getreg()
    local filename = vim.api.nvim_buf_get_name(0)

    if vim.endswith(filename, ".md") then
        if string.match(url, "https") or string.match(url, "http") then
            print("Opened in browser:", url)
            return vim.cmd("Open " .. url)
        end
        print("The selected text is not a valid URL")
    end
    print("Can't open links in non-markdown files")
end)
