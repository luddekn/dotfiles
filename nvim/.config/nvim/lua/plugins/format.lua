return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                bash = { "shfmt" },
                go = { "gofmt", "goimports" },
            },
            -- Set default options
            default_format_opts = {
                lsp_format = "fallback",
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500 },
        },
    },
}
