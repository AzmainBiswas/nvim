-- Decrease update time
vim.o.timeoutlen = 500
vim.o.updatetime = 200

-- Number of screen lines to keep above and below the cursor

vim.o.scrolloff = 8

-- Better editor UI

vim.o.number = true
vim.o.mouse = "a"
vim.o.numberwidth = 5
vim.o.relativenumber = true
vim.o.cursorline = false
vim.o.signcolumn = "number"
vim.o.colorcolumn = "99999" -- fix columns
vim.o.termguicolors = true

-- Better editing experience

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true

vim.o.wrap = false --long line false short line true
vim.o.textwidth = 300
vim.o.list = true
vim.o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

vim.o.hlsearch = false
vim.o.incsearch = true

-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search

vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Undo and backup options

vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false

-- Remember 50 items in commandline history

vim.o.history = 50

-- Better buffer splitting

vim.o.splitright = true
vim.o.splitbelow = true

-- spell checking

vim.o.spell = false
vim.o.spelllang = "en_us"

--nodejs provider of

vim.g.loaded_node_provider = 0

--purn suport desable
vim.g.loaded_purl_provider = 0

--vim comand--
vim.cmd([[ ]])
