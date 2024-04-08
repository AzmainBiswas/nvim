return {
    {
        "l3mon4d3/luasnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        -- build = "make install_jsregexp",
        config = function()
            -- config goes tere

            local ls = require("luasnip") --{{{

            -- require("luasnip.loaders.from_vscode").load()

            -- for linux
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

            -- For windows
            -- require("luasnip.loaders.from_lua").load({ paths = "C:/Users/azmain/AppData/Local/nvim/snippets/" })
            require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

            vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

            -- Virtual Text{{{
            local types = require("luasnip.util.types")
            ls.config.set_config({
                history = true,                --keep around last snippet local to jump back
                updateevents = "TextChanged,TextChangedI", --update changes as you type
                enable_autosnippets = true,
                store_selection_keys = "<Tab>",
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "●", "GruvboxOrange" } },
                        },
                    },
                },
            }) --}}}

            -- Key Mapping --{{{
            -- vim.keymap.set({ "i", "s" }, "<a-p>", function()
            -- 	if ls.expand_or_jumpable() then
            -- 		ls.expand()
            -- 	end
            -- end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-j>", function()
                if ls.jumpable() then
                    ls.jump(-1)
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<A-y>", "<Esc>o", { silent = true })

            vim.keymap.set({ "i", "s" }, "<a-k>", function()
                if ls.jumpable(1) then
                    ls.jump(1)
                end
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<a-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<a-l>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                else
                    -- print current time
                    local t = os.date("*t")
                    local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
                    print(time)
                end
            end)
            vim.keymap.set({ "i", "s" }, "<a-h>", function()
                if ls.choice_active() then
                    ls.change_choice(-1)
                end
            end) --}}}

            -- More Settings --

            vim.keymap.set(
                "n",
                "<Leader><CR>",
                "<CMD>lua require('luasnip.loaders').edit_snippet_files()<CR>",
                { silent = true, noremap = true }
            )
            -- vim.keymap.set('n', '<Leader>ls', "<cmd>so C:/Users/azmain/AppData/Local/nvim/plugin/luasnip.lua<CR>")
            vim.keymap.set("n", "<Leader>ls", "<cmd>so ~/.config/nvim/lua/biswas/plugins/LuaSnip.lua<CR>")
            vim.cmd(
                [[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]]
            )
        end, -- end of config
    },
}
