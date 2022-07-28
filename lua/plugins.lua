local fn = vim.fn

-- Automatically install packer if not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer, press enter, then type N, and press enter again")
	vim.cmd([[packadd packer.nvim]])
end

-- Automatically reload nvim when changes applied to plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	-- Plugins go here

	use("nvim-lua/plenary.nvim")

	-- Telescope related plugins
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	})

	-- Bufferling plugins
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Airline and themes for it
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")

	-- Comment plugins
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Nvim tree
	use("kyazdani42/nvim-tree.lua")

	-- Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("windwp/nvim-autopairs")
	use("p00f/nvim-ts-rainbow")

	-- LSP plugins
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Theme
	use("tanvirtin/monokai.nvim")

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Completion
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
