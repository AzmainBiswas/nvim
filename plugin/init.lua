vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/nvim-mini/mini.statusline", version = vim.version.range('*') },
    "https://github.com/folke/which-key.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("mini.statusline").setup()

require("which-key").add({
    { "<leader>s", group = "setting" },
    { "<leader>g", group = "lsp" },
    { "<leader>q", group = "quickfix" }
})

require("gitsigns").setup()
