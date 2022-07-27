set mouse=a
set encoding=utf-8
set number
set noswapfile
set scrolloff=7
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set expandtab
set fileformat=unix
set clipboard=unnamed
set nohlsearch

inoremap jj <esc>

nnoremap <C-t> :NERDTreeToggle<CR>

call plug#begin()

Plug 'https://github.com/nvim-lua/plenary.nvim'

" Telescope and its plugins
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Plugins for buffer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'moll/vim-bbye'

" Airline and themes for it
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Plugins for comments to work properly
Plug 'https://github.com/numToStr/Comment.nvim'
Plug 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'

Plug 'https://github.com/preservim/nerdtree'

" Treesitter plugins
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/p00f/nvim-ts-rainbow'

" LSP plugins
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/williamboman/nvim-lsp-installer'
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'

" themes
Plug 'https://github.com/tanvirtin/monokai.nvim'

" git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/lewis6991/gitsigns.nvim'

" snippets 
Plug 'https://github.com/L3MON4D3/LuaSnip'
Plug 'https://github.com/rafamadriz/friendly-snippets'

" cmp plugins
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'

" markdown preview plugins
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Theme
lua require('monokai').setup { palette = require('monokai').pro }

lua require'_cmp'
lua require'_gitsigns'
lua require'lsp'
lua require'_treesitter'
lua require'_comment'
lua require'_autopairs'
lua require'_telescope'
lua require'_buffer'
lua require'keymaps'

"Setting keymaps for telescope
nnoremap ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Adding this autocmd specifically for terraform lsp to proper work
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

let NERDTreeShowHidden=1
