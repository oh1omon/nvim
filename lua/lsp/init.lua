require("nvim-lsp-installer").setup({})
local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")

-- Initializing null-ls
require("lsp.null-ls")

lspconfig.yamlls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.17.0-standalone-strict/all.json"] = "/*.yaml",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "/azure-pipelines.yaml",
			},
		},
	},
})

lspconfig.bashls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.marksman.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.dockerls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.omnisharp.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.sumneko_lua.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- [vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig.jsonls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
	settings = {
		json = {
			schemas = {
				{
					description = "TypeScript compiler configuration file",
					fileMatch = {
						"tsconfig.json",
						"tsconfig.*.json",
					},
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					description = "ESLint config",
					fileMatch = {
						".eslintrc.json",
						".eslintrc",
					},
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					description = "Prettier config",
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc",
				},
				{
					description = "A JSON schema for the ASP.NET LaunchSettings.json files",
					fileMatch = { "launchsettings.json" },
					url = "https://json.schemastore.org/launchsettings.json",
				},
				{
					description = "NPM configuration file",
					fileMatch = {
						"package.json",
					},
					url = "https://json.schemastore.org/package.json",
				},
			},
		},
	},
})

lspconfig.cssls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.tsserver.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

lspconfig.terraformls.setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})
-- Some additional scripts needed for terraformls to work
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = vim.lsp.buf.format,
})
