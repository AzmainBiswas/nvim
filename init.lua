vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.laststatus = 2

require("settings.options")
require("settings.keymaps")
require("settings.autocmds")
require("settings.flowterm")
require("settings.terminal")
require("settings.vimpack")

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("cfilter")

