local augroup = vim.api.nvim_create_augroup("TermConfig", { clear = true })

local term_state = {
    bottom = {
        buf = -1,
        win = -1,
        height = -1
    }
}


-- disable line number and relative line number in neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0
        vim.cmd("startinsert") -- Cleaner way to enter insert mode
        -- vim.api.nvim_feedkeys("i", "n", false) -- Map normal mode to insert mode
    end
})

local function create_bottom_window(opts)
    opts = opts or {}
    local height = opts.height or math.floor(vim.o.lines / 3)

    -- create a new buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, {
        split = "below",
        height = height,
        win = -1,
        style = "minimal"
    })

    return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Bterm", function(opts)
    if not vim.api.nvim_win_is_valid(term_state.bottom.win) then
        local h = nil

        if term_state.bottom.height == -1 then
            h = tonumber(opts.args)
        else
            h = term_state.bottom.height
        end

        term_state.bottom = create_bottom_window({ buf = term_state.bottom.buf, height = h})
        if vim.bo[term_state.bottom.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        term_state.bottom.height = vim.api.nvim_win_get_height(term_state.bottom.win);
        vim.api.nvim_win_hide(term_state.bottom.win)
    end
end, {
    desc = "open terminal at bottom of the screen.",
    nargs = "?"
})

vim.keymap.set('n', '<C-t>', function()
    vim.cmd("Bterm")
end, { desc = 'terminal' })
