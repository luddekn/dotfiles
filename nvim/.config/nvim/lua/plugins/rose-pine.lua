return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "main",
            dark_variant = "main",
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
            palette = {
                main = {
                    base = "#000000",
                }
            }
        })
        vim.cmd("colorscheme rose-pine-main")
    end
}
