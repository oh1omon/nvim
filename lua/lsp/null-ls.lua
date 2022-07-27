local null_ls = require("null-ls")

-- The link to all built-in formatting, diagnostics and code_actions: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = { noremap = true, silent = true }

null_ls.setup({
	sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.terraform_fmt,
		formatting.uncrustify.with({ extra_args = { "--no-backup", "-c", "-" } }),
		diagnostics.eslint,
		code_actions.eslint,
	},
	on_attach = function(client, bufnr)
		--Setting a keymap to format exclusively to Null-LS server
		vim.api.nvim_buf_set_keymap(bufnr, "n", "F", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
		-- Setting a keymap to call code actions exclusively to Null-LS server
		vim.api.nvim_buf_set_keymap(bufnr, "n", "FF", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		-- This script will autoformat file on save with Null-LS server
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
