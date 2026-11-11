---@type vim.lsp.Config
vim.lsp.config('lua_ls', {
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
})

vim.lsp.enable('roslyn_ls')

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

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and (client.name == "roslyn_ls" or client.name == "omnisharp") then
            vim.lsp.semantic_tokens.enable(false, {
                bufnr = args.buf,
            })
        end
    end,
})

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
