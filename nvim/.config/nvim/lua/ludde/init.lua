require("ludde.remap")
require("ludde.set")
require("ludde.extension")

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "1.*",
	},
	"https://github.com/L3MON4D3/LuaSnip",
})

-- Oil config
require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = false,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
		natural_order = true,
	},
})

-- Colorscheme config
require("vague").setup({
	transparent = true,
})
vim.cmd("colorscheme vague")

-- Autopairs config
require("nvim-autopairs").setup({
	autopairs = { { "'", "'" }, { '"', '"' } },
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,
})

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"ts_ls",
		"cssls",
		"html",
		"prettier",
		"shfmt",
		"csharpier",
	},
})

-- Conform setup
require("conform").setup({
	formatters_by_ft = {
		cs = { "csharpier" },
		lua = { "stylua" },
		go = { "gofmt" },
		javascript = { "prettier" },
		markdown = { "prettier" },
		json = { "prettier" },
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

-- Tiny inline diag
require("tiny-inline-diagnostic").setup()

-- Markdown setup
require("render-markdown").setup({})

-- Treesitter setup
require("nvim-treesitter").setup({
	ensure_installed = { "lua", "javascript", "html", "css", "c_sharp" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- Blink setup
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})
vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}
