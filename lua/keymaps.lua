local opts = { noremap = false, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Navigate buffers
keymap("n", "<S-q>", ":Bdelete<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- ESC in Insert mode
keymap("i", "jj", "<Esc>", opts)

-- NerdTree toggle TODO
keymap("n", "C-t", ":NERDTreeToggle", opts)

-- Telescope
keymap("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
