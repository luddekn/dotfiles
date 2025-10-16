-- Filemanager plugin
return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = false,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name)
					return name == ".." or name == ".git"
				end,
			},
			keymaps = {
				["<leader>c"] = { "actions.close", mode = "n" },
			},
		})
	end,
}
