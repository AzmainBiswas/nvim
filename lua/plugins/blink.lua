return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        "l3mon4d3/LuaSnip",
    },

    version = '1.*',
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            },
            documentation = {
                auto_show = true,
                window = { border = "rounded" }
            }
        },
        signature = { enabled = true },
        sources = {
            default = { 'lsp', 'omni', 'path', 'snippets', 'buffer' },
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
