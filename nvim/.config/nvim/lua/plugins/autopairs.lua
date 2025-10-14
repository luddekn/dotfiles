-- Plugin for enabling autopairs for quotes and other brackets
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	opts = {
		check_ts = true,
		enable_check_bracket_line = true,
		autopairs = { { "'", "'" }, { '"', '"' } },
		enable_bracket_in_quote = true,
	},
}
