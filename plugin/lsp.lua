vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/l3mon4d3/LuaSnip",
    "https://github.com/j-hui/fidget.nvim",
})

require("fidget").setup()
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true
})

vim.diagnostic.config({
    update_in_insert = false,
    underline = true,
    virtual_lines = false,
    virtual_text = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
            vim.opt.complete = 'o,.,w,b,u'
            vim.opt.completeopt = 'menu,menuone,popup,noinsert,fuzzy'
            vim.lsp.completion.enable(true, client.id, ev.buf)
        end
    end
})

---@type vim.lsp.Config
local config = {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                preloadFileSize = 10000,
                library = {
                    vim.env.VIMRUNTIME,
                }
            },
        },
    },
}

vim.lsp.config('lua_ls', config)

vim.lsp.enable('roslyn_ls')
