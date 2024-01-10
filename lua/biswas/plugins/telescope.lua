return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			--configuration options
			require("telescope").setup({
				extensions = {
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

			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			-- vim.keymap.set("n", "<leader>fc", builtin.colorscheme,{})
			vim.keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
		end,
	},
}
