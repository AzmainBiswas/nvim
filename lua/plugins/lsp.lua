vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    { src = "https://github.com/l3mon4d3/LuaSnip", version = vim.version.range("2.*") },
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/j-hui/fidget.nvim",
    -- { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range('1.*') }
})

require("fidget").setup()
-- vim.notify = require("fidget").notify
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true
})

vim.diagnostic.config({
    update_in_insert = false,
    -- underline = true,
    virtual_lines = false,
    -- virtual_text = true,
    severity_sort = true,
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
    },
    underline = {
        severity = { min = vim.diagnostic.severity.WARN },
    },
})

local luasnip = require('luasnip')
luasnip.config.setup({
    enable_autosnippets = true,
})
require('luasnip.loaders.from_vscode').lazy_load()

-- native complition
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup', 'fuzzy' }
            vim.opt.complete = 'o,.,w,b,u'
            -- vim.opt.complete = 'o'
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })
        end
    end
})

-- Remap Tab to accept completion if the menu is open, otherwise act as normal Tab
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
    else
        return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
    end
end, { expr = true, noremap = true })

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

local border = "none"

-- require('blink.cmp').setup({
--     keymap = { preset = 'default' },
--     sources = {
--         default = { 'lsp', 'path', 'snippets', 'buffer' },
--     },
--     appearance = {
--         use_nvim_cmp_as_default = true,
--     },
--     completion = {
--         menu = {
--             border = border,
--             draw = { treesitter = { 'lsp' } }
--         },
--         documentation = {
--             auto_show = true,
--             auto_show_delay_ms = 100,
--             window = {
--                 border = border,
--             },
--         },
--         ghost_text = {
--             enabled = false,
--         }
--     },
--     signature = { enabled = true, window = { border = 'rounded' } },
--     fuzzy = {
--         implementation = "prefer_rust_with_warning"
--     },
--     cmdline = {
--         keymap = {
--             preset = 'inherit',
--             ['<Up>'] = { 'select_prev', 'fallback' },
--             ['<Down>'] = { 'select_next', 'fallback' },
--         },
--         completion = { menu = { auto_show = true } },
--     },
-- })
