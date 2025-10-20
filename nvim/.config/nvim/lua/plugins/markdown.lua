-- Plugin that makes markdown files prettier
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			heading = {
				custom = {
					{ pattern = "^# ", foreground = "HeadingH1", background = "HeadingH1", icon = "󰲡 " },
				},
			},
		})
		vim.api.nvim_set_hl(0, "HeadingH1", { fg = "#FFFFFF", bold = true, bg = "#5e2f38" })
	end,
}
