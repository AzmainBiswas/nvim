vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = true -- one liner

-- Undo and backup options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

-- for better search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- vim.opt.colorcolumn = "85"

-- netrw
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
