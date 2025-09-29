return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                auto_install = true,
                sync_install = false,
                highlight = {
                    additional_vim_regex_highlighting = true,
                    enable = true
                },

                indent = { enable = true },
            })
        end,
    }
}
