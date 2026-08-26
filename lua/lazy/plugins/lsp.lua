return {
    { "j-hui/fidget.nvim" },
    {
        "l3mon4d3/LuaSnip",
        dependencies = { 
            "rafamadriz/friendly-snippets"
        },
        config = function()
            local luasnip = require('luasnip')
            luasnip.config.setup({
                enable_autosnippets = true,
            })
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 
            "williamboman/mason.nvim", 
            "neovim/nvim-lspconfig" 
        },
        opts = {
            automatic_enable = true,
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 
            "j-hui/fidget.nvim",
        }
    }
}
