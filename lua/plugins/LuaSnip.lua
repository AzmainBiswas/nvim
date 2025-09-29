return {
    {
        "l3mon4d3/LuaSnip",
        version = "v2.*",
        build = (function()
            -- Build Step is needed for regex support in snippets.
            -- This step is not supported in many windows environments.
            -- Remove the below condition to re-enable on windows.
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                return
            end
            return 'make install_jsregexp'
        end)(),
        dependencies = {
            "rafamadriz/friendly-snippets",
            'saghen/blink.cmp',
        },
        config = function()
            -- config goes tere
            local ls = require("luasnip") --{{{

            require("luasnip.loaders.from_vscode").lazy_load()

            -- for linux
            require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })

            -- For windows
            -- require("luasnip.loaders.from_lua").load({ paths = "C:/Users/azmain/AppData/Local/nvim/snippets/" })

            require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

            vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

            -- Virtual Text{{{
            local types = require("luasnip.util.types")
            ls.config.set_config({
                history = true,                            --keep around last snippet local to jump back
                updateevents = "TextChanged,TextChangedI", --update changes as you type
                enable_autosnippets = true,
                -- store_selection_keys = "<Tab>",
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "●", "GruvboxOrange" } },
                        },
                    },
                },
            }) --}}}

            -- Key Mapping
            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})

            -- More Settings --

            vim.keymap.set(
                "n",
                "<Leader><CR>",
                "<CMD>lua require('luasnip.loaders').edit_snippet_files()<CR>",
                { silent = true, noremap = true }
            )
            -- vim.keymap.set('n', '<Leader>ls', "<cmd>so C:/Users/azmain/AppData/Local/nvim/plugin/luasnip.lua<CR>")
            vim.keymap.set("n", "<Leader>ls", "<cmd>so ~/.config/nvim/lua/plugins/LuaSnip.lua<CR>")
            -- vim.cmd(
            --     [[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]]
            -- )
        end, -- end of config
    },
}
