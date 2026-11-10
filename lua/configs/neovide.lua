vim.o.guifont = "FiraCode Nerd Font Mono:h12"
vim.g.neovide_corner_preference = "round"
vim.g.neovide_window_blurred = true
vim.g.neovide_opacity = 1
vim.g.neovide_normal_opacity = 1
vim.g.neovide_theme = 'auto'


require('onedark').setup {
    style = 'dark',
    transparent = false,
}
require('onedark').load()
