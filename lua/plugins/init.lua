return {
    { "nvim-lua/plenary.nvim" },

    -- LSP progress messages.
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },
}
