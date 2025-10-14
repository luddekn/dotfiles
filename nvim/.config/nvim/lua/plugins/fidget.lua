-- Plugin that shows LSP load status
return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			window = {
				normal_hl = "Comment",
				winblend = 0,
				border = "rounded",
				zindex = 45,
				max_width = 0,
				max_height = 0,
				x_padding = 1,
				y_padding = 0,
				align = "bottom",
				relative = "editor",
				tabstop = 8,
				avoid = {},
			},
		},
	},
}
