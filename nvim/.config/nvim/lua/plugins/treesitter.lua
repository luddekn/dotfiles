return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Languages to install parsers for
            ensure_installed = { "go", "lua", "javascript", "typescript", "html", "css" },

            -- Enable syntax highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
