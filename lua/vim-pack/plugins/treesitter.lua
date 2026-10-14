vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    -- "https://github.com/nvim-treesitter/nvim-treesitter-context"
})

local nts = require("nvim-treesitter")
vim.api.nvim_create_autocmd('PackChanged', { callback = function() nts.update() end })

nts.setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

nts.install({ "vim", "vimdoc", "query", "c_sharp", "python" })

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local bufnr = args.buf
        local ok = pcall(vim.treesitter.get_parser, bufnr)

        if not ok then
            return
        end

        -- Enable highlight when a parser is available.
        pcall(vim.treesitter.start, bufnr)

        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"

        -- Enable Tree-sitter indentation
        -- vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.opt.foldcolumn = '0'
vim.opt.foldenable = false
