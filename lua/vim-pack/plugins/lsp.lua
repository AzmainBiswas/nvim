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

local luasnip = require('luasnip')
luasnip.config.setup({
    enable_autosnippets = true,
})
require('luasnip.loaders.from_vscode').lazy_load()

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
