vim.api.nvim_create_user_command('Qrun', function(opts)
    -- Specify the file to log output
    local log_file = '/tmp/nvim_cmd_output.log'

    -- Run the command and capture the output
    local output = vim.fn.systemlist(opts.args .. ' 2>&1 | tee ' .. log_file)

    -- Check if command failed
    if vim.v.shell_error ~= 0 then
        print("Command failed: " .. table.concat(output, "\n"))
        return
    end

    -- Populate Quickfix list with formatted output
    vim.fn.setqflist({}, ' ', {
        title = 'Command Output',
        lines = output
    })
    vim.cmd('copen')
end, { nargs = '+' })

-- Besic auto comend
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = 'Highlight when yanking text',
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end
})

-- disable line number and relative line number in neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.api.nvim_feedkeys("i", "n", false) -- Map normal mode to insert mode
    end
})

-- open spell checker in some files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = { "*.md", ".txt" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
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
