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
		config = function()
			local name = "solarized-osaka"
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
			changeColor(name)
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			local name = "rose-pine"
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
			changeColor(name)
		end,
	},
}
