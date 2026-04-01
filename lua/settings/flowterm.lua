-- floating terminal
local term_state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.6)
    local height = opts.height or math.floor(vim.o.lines * 0.6)


    -- Center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a new buffer (not listed)
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    -- Open the floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
    })

    return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("FloTerm", function()
    if not vim.api.nvim_win_is_valid(term_state.floating.win) then
        term_state.floating = create_floating_window({ buf = term_state.floating.buf })
        if vim.bo[term_state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(term_state.floating.win)
    end
end, {})


vim.keymap.set('n', '<leader>tf', function() vim.cmd("FloTerm") end, { desc = 'floating terminal' })
