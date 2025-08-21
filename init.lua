vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
require("lazy").setup({ import = "plugins" }, {
    change_detection = { notify = false },
})

-- set Color Scheme
local color = "gruvbox"
-- local color = "nord"
-- local color = "catppuccin-mocha"
-- local color = "github_dark_default"
-- local color = "habamax"
-- local color = "tokyonight-night"
-- local color = "onedark"
vim.opt.background = "dark"
vim.cmd.colorscheme(color)

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- vim.cmd([[ autocmd TermOpen * setlocal nonumber norelativenumber ]])

-- global status line for all pains
vim.o.laststatus = 2
