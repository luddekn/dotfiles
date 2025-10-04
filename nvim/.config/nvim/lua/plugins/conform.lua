return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
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
                }
            }
        })

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ bufnr = 0 })
        end, { desc = "Format buffer" })
    end,
}
