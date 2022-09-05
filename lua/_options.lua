local options = {
	mouse = "a",
	fileencoding = "utf-8",
	number = true,
	swapfile = false,
	scrolloff = 8,
	tabstop = 2,
	expandtab = false,
	shiftwidth = 2,
	smarttab = true,
	autoindent = true,
	clipboard = "unnamedplus",
	hlsearch = false,
	splitbelow = true,
	splitright = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
