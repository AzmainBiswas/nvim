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
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.wrap = false -- one liner

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

vim.opt.termguicolors = true
-- vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "100"

vim.opt.title = true
vim.opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

vim.opt.winborder = "rounded" --default border for window.

-- netrw
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim.opt.guicursor = "a:block" -- "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50"
