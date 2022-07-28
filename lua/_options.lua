local options = {
	mouse = "a",
	fileencoding = "utf-8",
	number = true,
	swapfile = false,
	scrolloff = 8,
	tabstop = 4,
	shiftwidth = 4,
	smarttab = true,
	autoindent = true,
	expandtab = true,
	clipboard = "unnamedplus",
	hlsearch = false,
	splitbelow = true,
	splitright = true,
	signcolumn = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
