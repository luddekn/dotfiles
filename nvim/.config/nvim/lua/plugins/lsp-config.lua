return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim",          build = function() pcall(vim.cmd, "MasonUpdate") end },
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
    },
    config = function()
        local lsp = require("lsp-zero")

        -- Keymaps
        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        end)

        -- Mason
        require("mason").setup({})
        require("mason-lspconfig").setup({})

        -- Manual LSP setup
        -- ts_ls
        require("lspconfig").ts_ls.setup({
            on_attach = lsp.on_attach,
        })

        -- lua_ls
        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        -- html
        require("lspconfig").html.setup({
            on_attach = lsp.on_attach,
        })

        -- cssls
        require("lspconfig").cssls.setup({
            on_attach = lsp.on_attach,
        })

        -- Completion
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
            sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } },
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
        })

        -- Cmdline completion
        cmp.setup.cmdline("/", { mapping = cmp.mapping.preset.cmdline(), sources = { { name = "buffer" } } })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = "path" } },
                { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
            ),
        })

        -- Activate lsp-zero
        lsp.setup()
    end,
}
