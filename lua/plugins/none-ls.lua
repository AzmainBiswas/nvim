return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- c
                null_ls.builtins.formatting.clang_format,
                -- lua
                null_ls.builtins.formatting.stylua,
                -- python
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.pylint,
                -- javascript
                null_ls.builtins.formatting.prettier,
                -- shell
                null_ls.builtins.formatting.shfmt,
            },
        })
    end,
}
