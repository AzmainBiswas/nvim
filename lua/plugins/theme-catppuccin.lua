return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            no_italic = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
        })
    end,
}
