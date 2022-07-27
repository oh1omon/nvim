local opts = { noremap = false, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Navigate buffers
keymap("n", "<S-q>", ":Bdelete<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)
