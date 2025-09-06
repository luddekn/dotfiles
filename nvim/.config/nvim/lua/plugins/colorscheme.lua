function changeColor(id)
    local colorScheme
    if id == 1 then
        colorScheme = "rose-pine"
    elseif id == 2 then
        colorScheme = "solarized-osaka"
    else
        colorScheme = "rose-pine"
    end
    vim.cmd.colorscheme(colorScheme)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        config = function()
            require("solarized-osaka").setup({
                disable_background = true,
                styles = {
                    floats = "dark",
                    sidebar = "dark",
                    italic = false,
                },
                hide_inactive_statusline = true,
                dim_inactive = true,
                lualine_bold = true,
            })
            changeColor(2)
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                styles = {
                    floats = "dark",
                    sidebar = "dark",
                    italic = false,
                },
                hide_inactive_statusline = true,
                dim_inactive = true,
                lualine_bold = true,
            })
            changeColor(1)
        end,
    },
}
