return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local theme = vim.cmd.colorscheme()
		local lualineTheme
		if theme == "rose-pine" then
			lualineTheme = "rose-pine"
		elseif theme == "solarized-osaka" then
			lualineTheme = "solarized_dark"
		else
			lualineTheme = "auto"
		end
		require("lualine").setup({
			options = {
				theme = lualineTheme,
			},
		})
	end,
}
