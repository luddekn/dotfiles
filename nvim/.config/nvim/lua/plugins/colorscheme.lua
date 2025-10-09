function changeColor(color)
    color = color or "solarized-osaka"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("solarized-osaka").setup({
                transparent = true,
                styles = {
                    floats = "dark",
                },
                on_colors = function(colors)
                    colors.hint = colors.orange
                    colors.error = colors.red
                    colors.border = colors.yellow
                    colors.info = colors.blue
                end,
            })
            changeColor()
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
            })
            changeColor()
        end,
    },
}
