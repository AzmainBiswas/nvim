function PackGet()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false

    local packages = vim.iter(vim.pack.get()):map(function(x) return x.spec.name end):totable()

    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, buf) -- attach buffer to window
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, packages)
    vim.api.nvim_set_current_buf(buf)
end

function PackDel()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false

    local packages = vim.iter(vim.pack.get()):map(function(x) return x.spec.name end):totable()

    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, buf) -- attach buffer to window
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, packages)
    vim.api.nvim_set_current_buf(buf)

    local prev = vim.deepcopy(packages)

    vim.api.nvim_create_autocmd("TextChanged", {
        buffer = buf,
        callback = function()
            local current = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local removed = {}
            local current_set = {}
            for _, name in ipairs(current) do
                current_set[name] = true
            end

            for _, name in ipairs(prev) do
                if not current_set[name] then
                    table.insert(removed, name)
                end
            end

            if #removed > 0 then
                vim.pack.del(removed)
            end
            prev = current
        end
    })
end

vim.api.nvim_create_user_command("PackGet", PackGet, {})
vim.api.nvim_create_user_command("PackDel", PackDel, {})
