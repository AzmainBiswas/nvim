vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/folke/tokyonight.nvim",
    { src = "https://github.com/rose-pine/neovim",                 name = "rose-pine" },
    "https://github.com/ellisonleao/gruvbox.nvim"
    -- { src = "https://github.com/maxmx03/solarized.nvim" },
})

vim.opt.background = "dark"

-- vim.cmd.colorscheme("habamax")
vim.cmd.colorscheme("catppuccin-mocha")
-- vim.cmd.colorscheme("solarized")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("slate")
-- vim.cmd.colorscheme("retrobox")
-- vim.cmd.colorscheme("gruvbox")

-- Source - https://stackoverflow.com/a
-- Posted by C. Khalifa
-- Retrieved 2026-01-16, License - CC BY-SA 4.0
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none"})
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none"})
