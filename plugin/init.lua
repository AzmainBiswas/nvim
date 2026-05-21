vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/nvim-mini/mini.icons",      version = 'stable' },
    { src = "https://github.com/nvim-mini/mini.statusline", version = 'stable' },
    "https://github.com/folke/which-key.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("mini.icons").setup()

require("which-key").add({
    { "<leader>s", group = "setting" },
    { "<leader>g", group = "lsp" },
    { "<leader>q", group = "quickfix" }
})

require("gitsigns").setup()
-- require("mini.statusline").setup()

local function get_active_lsps()
    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(buf_clients) == nil then
        return ""
    end

    local client_names = {}
    for _, client in pairs(buf_clients) do
        table.insert(client_names, client.name)
    end

    -- Returns something like "[lua_ls, vtsls]"
    return "[" .. table.concat(client_names, ", ") .. "]"
end

local statusline = require("mini.statusline")

statusline.setup({
    use_icons = true,
    content = {
        -- Override the active statusline layout
        active = function()
            -- 1. Grab all the default mini.statusline sections
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git           = statusline.section_git({ trunc_width = 40 })
            local diff          = statusline.section_diff({ trunc_width = 75 })
            local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = statusline.section_lsp({ trunc_width = 75 })
            -- local filename      = statusline.section_filename({ trunc_width = 140 })
            local filename      = '%f %m%r'
            local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
            local location      = statusline.section_location({ trunc_width = 75 })

            local lsp_name      = get_active_lsps();
            -- local progress = vim.ui.progress_status and vim.ui.progress_status() or ""

            -- 3. Combine them all using mini's layout builder
            return statusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
                -- Use %= to push everything after this to the center/right of the statusline
                -- "%=",
                -- Place the filename block in the middle
                { hl = "MiniStatuslineFilename", strings = { filename } },
                "%=",
                -- Inject the LSP progress on the right side next to the connected LSP names
                { hl = "MiniStatuslineDevinfo",  strings = { lsp_name } },
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
            })
        end,
    },
})
