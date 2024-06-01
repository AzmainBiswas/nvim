return {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            styles = {
                comments = { italic = true },
                functions = {},
            },
            sidebars = { "qf", "vista_kind", "terminal", "packer" },
        })
    end,
}
