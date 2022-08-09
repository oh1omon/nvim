local nvim_tree = require("nvim-tree")

-- nvim_tree.toggle(false)

nvim_tree.setup({
	open_on_setup = true,
	ignore_buffer_on_setup = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
