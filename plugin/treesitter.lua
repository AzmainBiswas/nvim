vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context"
})

local nts = require("nvim-treesitter")
vim.api.nvim_create_autocmd('PackChanged', { callback = function() nts.update() end })

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

vim.api.nvim_create_autocmd("FileType", { -- enable treesitter highlighting and indents
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
        end
    end
})
