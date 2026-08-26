return {
    { 
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, 
        config = function()
            require('render-markdown').setup({}) -- only mandatory if you want to set custom options
        end
    },
    { "nvim-lua/plenary.nvim" },
    { "folke/which-key.nvim" },
    { 
        "danymat/neogen",
        config = function()
            require('neogen').setup({ snippet_engine = "luasnip" })

            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function ()
            require('nvim-highlight-colors').setup()
        end
    },
}
