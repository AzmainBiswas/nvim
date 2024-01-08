require("telescope").setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {},
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		find_files = { theme = "dropdown" },
		fd = { theme = "dropdown" },
		buffers = { theme = "ivy" },
		current_buffer_fuzzy_find = { theme = "ivy" },
		live_grep = { theme = "dropdown" },
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")

-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- vim.keymap.set("n", "<leader>fc", builtin.colorscheme,{})
vim.keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

vim.api.nvim_set_keymap(
	"n",
	"<leader>vp",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ noremap = true }
)
