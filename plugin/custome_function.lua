-- Besic auto comend
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = 'Highlight when yanking text',
    group = augroup,
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            -- timeout = 40,
        })
    end
})


-- Return to last edited position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})


-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = augroup,
--     callback = function(e)
--         local buf = e.buf
--         vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
--             { desc = "go to difinition", silent = true, remap = false, buffer = buf })
--         vim.keymap.set("n", "cd", function() vim.lsp.buf.rename() end,
--             { desc = "Rename", silent = true, remap = false, buffer = buf })
--         vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
--             { desc = "Find References", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
--             { desc = "Find References", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end,
--             { desc = "Peck difinition", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
--             { desc = "workspace_symbol", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
--             { desc = "open_float", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
--             { desc = "goto next", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
--             { desc = "goto previous", silent = true, remap = false, buffer = buf })
--
--         vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
--             { desc = "Code Action", silent = true, remap = false, buffer = buf })
--         vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
--             { desc = "Rename", silent = true, remap = false, buffer = buf })
--         vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
--             { desc = "signature_help", silent = true, remap = false, buffer = buf })
--     end
-- })
