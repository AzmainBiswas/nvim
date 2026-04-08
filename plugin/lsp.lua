vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/l3mon4d3/LuaSnip",
    "https://github.com/j-hui/fidget.nvim",
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range('1.*') }
})

require("fidget").setup()
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true
})

vim.diagnostic.config({
    update_in_insert = false,
    -- underline = true,
    virtual_lines = false,
    virtual_text = false,
    severity_sort = true,
    underline = {
        severity = { min = vim.diagnostic.severity.WARN },
    },
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--         if client:supports_method('textDocument/completion') then
--             vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--             vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup', 'fuzzy'}
--             vim.opt.complete = 'o,.,w,b,u'
--             vim.lsp.completion.enable(true, client.id, ev.buf, {
--                 autotrigger = true,
--             })
--         end
--     end
-- })

-- Define the border style
local border = "rounded"

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

require('blink.cmp').setup({
    appearance = {
        use_nvim_cmp_as_default = true,
    },
    completion = {
        menu = {
            border = 'rounded',
            draw = { treesitter = { 'lsp' } } 
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 100,
            window = { border = 'rounded' },
        },
        ghost_text = {
            enabled = true,
        }
    },
    signature = { enabled = true, window = { border = 'rounded' } },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
    },
})
