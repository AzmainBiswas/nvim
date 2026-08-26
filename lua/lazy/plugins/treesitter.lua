return {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "vim", "vimdoc", "query" },
            auto_install = true,
            sync_install = false,
            highlight = {
                additional_vim_regex_highlighting = true,
                enable = true
            },

            indent = { enable = true },
        })

        vim.opt.foldcolumn = '0'
        vim.opt.foldenable = false
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
}
