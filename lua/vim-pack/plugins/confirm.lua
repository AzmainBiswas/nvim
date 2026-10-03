vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
    formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
    }
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.api.nvim_create_user_command("FormalBuff", function(args)
    require("conform").format({ bufnr = args.buf })
end, {desc = "Format buffer"})
