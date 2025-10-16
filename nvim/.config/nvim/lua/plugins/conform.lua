-- Plugin for formatting files, uses various formatters installed with Mason
return {
	"stevearc/conform.nvim",
	opts = {
		ensure_installed = {
			"prettierd",
			"prettier",
			"csharpier",
			"stylua",
			"gofmt",
			"shfmt",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cs = { "csharpier" },
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				html = { "prettier" },
				bashls = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				prettier = {
					args = function()
						-- If the filename ends with .ejs use HTML as the formatter
						local filename = vim.api.nvim_buf_get_name(0)
						if vim.endswith(filename, ".ejs") then
							return { "--stdin-filepath", filename, "--parser", "html" }
						end
						return { "--stdin-filepath", filename }
					end,
				},
			},
		})
	end,
}
