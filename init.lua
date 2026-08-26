vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.laststatus = 3

require("lazy.lazy")
-- require("vim-pack")

require("configs.options")
require("configs.keymaps")
require("configs.autocmds")
require("configs.flowterm")
require("configs.terminal")
require("configs.vimpack")
require("configs.build")
require("configs.grep")
require("configs.lsp")

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("cfilter")

-- require('vim._core.ui2').enable({
--     msg = {
--         target = 'cmd',
--         cmd = { height = 1 }
--     }
-- })

-- insert current time.
vim.api.nvim_create_user_command("Now", function()
    local date = tostring(os.date("%Y-%m-%d %I:%M:%S %p"));
    vim.api.nvim_put({ date }, "c", true, true);
end, {})
