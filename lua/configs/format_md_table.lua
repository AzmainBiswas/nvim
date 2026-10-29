local function split_row(line)
    line = vim.trim(line)

    if line:sub(1, 1) == "|" then
        line = line:sub(2)
    end

    local cells = {}
    local cell = {}
    local escaped = false

    for i = 1, #line do
        local char = line:sub(i, i)
        if char == "|" and not escaped then
            table.insert(cells, vim.trim(table.concat(cell)))
            cell = {}
        else
            table.insert(cell, char)
        end

        if char == "\\" then
            escaped = true
        else
            escaped = false
        end
    end

    return cells
end

local function format_markdown_table(start_line, end_line)
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    local rows = {}

    for _, line in ipairs(lines) do
        if not line:find("|", 1, true) then
            vim.notify("Selected lines must be Markdown table", vim.log.levels.ERROR)
            return
        end
        table.insert(rows, split_row(line))
    end

    -- count number of columns
    local column_count = 0
    for _, row in ipairs(rows) do
        column_count = math.max(column_count, #row)
    end

    if column_count == 0 then
        return
    end

    -- normalize the rows to match same column
    for _, row in ipairs(rows) do
        for col = #rows + 1, column_count do
            row[col] = ""
        end
    end

    -- calculate widths
    local widths = {}
    for col = 1, column_count do
        widths[col] = 3;
        for _, row in ipairs(rows) do
            local cell = row[col]
            local is_seperator = cell:match("^:?-+:?$") ~= nil

            if not is_seperator then
                widths[col] = math.max(widths[col], vim.fn.strdisplaywidth(cell))
            end
        end
    end

    -- formatcells
    local formatted = {}
    for _, row in ipairs(rows) do
        local cells = {}
        local is_seperator = false
        for col, cell in ipairs(row) do
            is_seperator = cell:match("^:?-+:?$") ~= nil
            if is_seperator then
                local left = cell:sub(1, 1) == ":"
                local right = cell:sub(-1) == ":"
                local dashes = widths[col] - (left and 1 or 0) - (right and 1 or 0) + 1 + 1

                dashes = math.max(dashes, 1)
                cell = (left and ":" or "") .. string.rep("-", dashes) .. (left and ":" or "")
            else
                local padding = widths[col] - vim.fn.strdisplaywidth(cell)
                cell = " " .. cell .. string.rep(" ", math.max(0, padding)) .. " "
            end
            table.insert(cells, cell)
        end

        table.insert(formatted, "|" .. table.concat(cells, "|") .. "|")
    end

    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, formatted)
end

-- Visual Line mode: select the table and press <leader>mt
vim.keymap.set("x", "<leader>mt", function()
    local first = vim.fn.line("v")
    local last  = vim.fn.line(".")

    format_markdown_table(math.min(first, last), math.max(first, last))
    vim.cmd("normal! \27")
end, { desc = "Format selected Markdown table" })

-- Command-line: :FormatMarkdownTable
vim.api.nvim_create_user_command("FormatMarkdownTable", function(opts)
    format_markdown_table(opts.line1, opts.line2)
end, {
    range = true,
    desc = "Format selected Markdown table",
})
