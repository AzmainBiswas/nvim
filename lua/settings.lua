-- Decrease update time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

-- Number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Better editor UI
--vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkon2-Cursor,r-cr-o:hor20"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "number"
vim.opt.colorcolumn = "99999" -- fix columns
vim.opt.termguicolors = true

-- Better editing experience

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = false

vim.opt.wrap = true --long line false short line true
vim.opt.textwidth = 300
vim.opt.list = true
vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search

vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = false

-- Undo and backup options

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false

-- Remember 50 items in commandline history

vim.opt.history = 50

-- Better buffer splitting

vim.opt.splitright = true
vim.opt.splitbelow = true

-- spell checking

vim.opt.spell = false
vim.opt.spelllang = "en_us"

--nodejs provider of

vim.g.loaded_node_provider = 0

--purn suport desable
vim.g.loaded_purl_provider = 0

--vim comand--
vim.cmd([[ ]])
