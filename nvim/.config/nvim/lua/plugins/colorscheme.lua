-- Plugin for nvim colorscheme, using solarized-osaka
return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = false,
				styles = {
					floats = "dark",
					sidebars = "dark",
				},
				on_colors = function(colors)
					colors.hint = colors.orange
					colors.error = colors.red
					colors.border = colors.yellow700
					colors.info = colors.blue
				end,
			})
			vim.cmd.colorscheme("solarized-osaka")
			vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#664d00" })
		end,
	},
}
