return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1001,
    config = function()
        require('tiny-inline-diagnostic').setup()
        vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end
}
