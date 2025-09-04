return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },

		-- Formatting & UI
		"stevearc/conform.nvim",
		"j-hui/fidget.nvim",

		-- Auto-pairs for parentheses/quotes
		"windwp/nvim-autopairs",
	},

	config = function()
		local lsp = require("lsp-zero")

		-- Setup LSP keymaps
		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		end)

		-- Conform formatter
		local formatters = require("plugins.format") -- adjust path if necessary
		require("conform").setup(formatters[1].opts)

		-- Capabilities for nvim-cmp
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Mason setup
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls", "gopls", "cssls", "html", "clangd" },
		})

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Fidget UI
		require("fidget").setup({})

		-- CMP setup
		local cmp = require("cmp")
		local cmp_action = lsp.cmp_action()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-y>"] = cmp.mapping.complete(),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})

		-- Command-line completion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
				{ { name = "path" } },
				{ { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
			),
		})

		-- Diagnostics config
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Setup nvim-autopairs for parentheses/quotes
		require("nvim-autopairs").setup({
			check_ts = true,
			enable_check_bracket_line = true,
			autopairs = { { "'", "'" }, { '"', '"' } },
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Manual setup of each LSP server
		local lspconfig = require("lspconfig")

		-- Lua
		lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

		-- TypeScript / JavaScript
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = lsp.on_attach,
		})

		-- Go
		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = lsp.on_attach,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = lsp.on_attach,
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = lsp.on_attach,
		})

		-- C / C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = lsp.on_attach,
		})

		-- Activate lsp-zero
		lsp.setup()
	end,
}
