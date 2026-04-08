vim.pack.add({
    -- { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    -- "https://github.com/folke/tokyonight.nvim"
    -- "https://github.com/ellisonleao/gruvbox.nvim"
})

vim.opt.background = "dark"

vim.cmd.colorscheme("habamax")
-- vim.cmd.colorscheme("slate")
-- vim.cmd.colorscheme("retrobox")
-- vim.cmd.colorscheme("gruvbox")

-- Source - https://stackoverflow.com/a
-- Posted by C. Khalifa
-- Retrieved 2026-01-16, License - CC BY-SA 4.0
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
-- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none"})
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none"})
