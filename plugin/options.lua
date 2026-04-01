vim.opt.scrolloff = 8
vim.opt.smoothscroll = true
vim.opt.confirm = true

vim.opt.number = true
-- vim.opt.numberwidth = 4
vim.opt.textwidth = 100
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1" --left column
vim.opt.colorcolumn = "100"

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
vim.opt.linebreak = true

-- for better search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.grepprg = "rg --vimgrep --smart-case"

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.isfname:append("@-@")

vim.opt.title = true
vim.opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

-- netrw
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim.opt.guicursor = "a:block" -- "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50"

if vim.uv.os_uname().sysname == "Windows_NT" then
    if vim.fn.executable("pwsh.exe") == 1 then
        vim.opt.shell = "pwsh.exe"
    else
        vim.opt.shell = "powershell.exe"
    end
    local powershell_options = {
        "-NoLogo",
        "-NoProfile",
        "-ExecutionPolicy RemoteSigned",
        "-Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();",
        "$PSDefaultParameterValues['Out-File:Encoding']='utf8';",
    }

    vim.opt.shellcmdflag = table.concat(powershell_options, " ")
    vim.opt.shellpipe = "> %s 2>&1"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end
