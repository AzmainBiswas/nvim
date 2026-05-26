vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.laststatus = 3

require("settings.options")
require("settings.keymaps")
require("settings.autocmds")
require("settings.flowterm")
require("settings.terminal")
require("settings.vimpack")
require("settings.build")
require("settings.grep")

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("cfilter")

require('vim._core.ui2').enable({
    msg = {
        target = 'cmd',
        cmd = { height = 1 }
    }
})

-- insert current time.
vim.api.nvim_create_user_command("Now", function()
    local date = tostring(os.date("%Y-%m-%d %I:%M:%S %p"));
    vim.api.nvim_put({ date }, "c", true, true);
end, {})
