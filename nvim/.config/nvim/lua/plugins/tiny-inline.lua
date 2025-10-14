-- Plugin that enabled prettier diagnostics in nvim
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1001,
	config = function()
		require("tiny-inline-diagnostic").setup()
		vim.diagnostic.config({ virtual_text = false })
		vim.diagnostic.config({ underline = false })
	end,
}
