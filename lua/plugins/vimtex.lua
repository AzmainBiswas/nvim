return {
    "lervag/vimtex",
    init = function()
        vim.api.nvim_command("filetype plugin indent on")

        -- vim.g.vimtex_compiler_method = 'latex'
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0
        -- vim.opt.conceallevel = 1
        vim.g.tex_conceal = "abdmg"

        -- for windows
        -- vim.g.vimtex_view_general_viewer = 'C:\\Users\\azmai\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe'
        -- vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

        -- for linux
        vim.g.vimtex_view_method = "zathura"
    end,
}
