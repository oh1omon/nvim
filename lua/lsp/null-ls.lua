local null_ls = require("null-ls")

-- The link to all built-in formatting, diagnostics and code_actions: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = { noremap = true, silent = true }

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"F",
			"<cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == 'null-ls' end }) <CR>",
			opts
		)
		-- Setting a keymap to call code actions exclusively to Null-LS server
		vim.api.nvim_buf_set_keymap(bufnr, "n", "FF", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		-- This script will autoformat file on save with Null-LS server
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
