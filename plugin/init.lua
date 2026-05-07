vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/nvim-mini/mini.icons",      version = 'stable' },
    { src = "https://github.com/nvim-mini/mini.statusline", version = 'stable' },
    "https://github.com/folke/which-key.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("mini.statusline").setup()
require("mini.icons").setup()

require("which-key").add({
    { "<leader>s", group = "setting" },
    { "<leader>g", group = "lsp" },
    { "<leader>q", group = "quickfix" }
})

require("gitsigns").setup()
