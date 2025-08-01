return {
    { "nvim-lua/plenary.nvim" },

    --[[ auto pairs ]]
    {
        "echasnovski/mini.pairs",
        version = "*",
        config = function()
            require("mini.pairs").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },
    --[[ Highlight todo, notes, etc in comments ]]
    --[[ {
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	}, ]]

    --[[ git decorations implemented purely in Lua ]]
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
}
