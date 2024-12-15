return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = false,
			styles = {
				floats = "dark",
				sidebar = "dark",
			},
			hide_inactive_statusline = true,
			dim_inactive = true,
			lualine_bold = true,
		})
		vim.cmd([[colorscheme solarized-osaka-night]])
	end,
}
