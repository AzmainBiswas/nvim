-- pre load
require("pre")

-- lazy packagemannager plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
	spec = "plugins",
	change_detection = { notify = false },
})

-- set color
-- set Color Scheme
-- local color = "gruvbox"
local color = "catppuccin-mocha"
-- local color = "github_dark_default"
-- local color = "tokyonight-night"
vim.cmd.colorscheme(color)

-- disable line number and relative line number in neovim terminal
vim.cmd([[ autocmd TermOpen * setlocal nonumber norelativenumber ]])

-- custome status line
require("custom.statusline")

-- global status line for all pains
vim.o.laststatus = 3
