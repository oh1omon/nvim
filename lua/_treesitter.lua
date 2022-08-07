local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"c_sharp",
		"lua",
		"comment",
		"go",
		"html",
		"javascript",
		"json",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"scss",
		"tsx",
		"typescript",
		"yaml",
		"dockerfile",
		"hcl",
		"bash",
	},
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

parser_configs.hcl = {
	filetype = "hcl",
	"terraform",
}
