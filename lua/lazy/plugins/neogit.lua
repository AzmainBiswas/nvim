return {
    "NeogitOrg/neogit",
    lazy = true,
    keys = {
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    },
    dependencies = {
        "sindrets/diffview.nvim",
        "folke/snacks.nvim",
    },
    opts = {
        integrations = {
            telescope = false,
            snack = true,
        }
    },
}
