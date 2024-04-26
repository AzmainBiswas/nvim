return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = false,
            styles = {
                comments = { italic = true },
                functions = {},
            },
            sidebars = { "qf", "vista_kind", "terminal", "packer" },
        })
    end,
}
