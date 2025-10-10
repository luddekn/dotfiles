-- Ejs files should be recognized
vim.filetype.add({ extension = { ejs = "ejs" } })
-- Treat ejs files as html files
vim.filetype.add({
    extension = {
        ejs = "html",
    }
})
