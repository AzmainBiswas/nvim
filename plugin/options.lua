local opt = vim.opt
local g = vim.g

opt.scrolloff = 8

opt.number = true
opt.numberwidth = 4
opt.relativenumber = true
opt.cursorline = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.smarttab = true
opt.wrap = false -- one liner

-- Undo and backup options
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false

-- for better search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Makes neovim and host OS clipboard play nicely with each other
opt.clipboard = "unnamedplus"

opt.termguicolors = true
-- opt.winborder = "rounded"
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "100"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.winborder = "rounded" --default border for window.

-- netrw
-- disable netrw at the very start of your init.lua
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

opt.guicursor = "a:block" -- "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50"
