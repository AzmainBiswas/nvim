return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				components = {
					harpoon_index = function(config, node, _)
						local Marked = require("harpoon.mark")
						local path = node:get_id()
						local success, index = pcall(Marked.get_index_of, path)
						if success and index and index > 0 then
							return {
								text = string.format(" [h] %d ", index), -- <-- Add your favorite harpoon like arrow here
								highlight = config.highlight or "NeoTreeDirectoryIcon",
							}
						else
							return {
								text = "  ",
							}
						end
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name", use_git_status_colors = true },
						{ "harpoon_index" }, --> This is what actually adds the component in where you want it
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
			source_selector = {
				winbar = false,
				statusline = false,
			},
			window = {
				position = "left",
				width = 35,
				mappings = {
					["e"] = function()
						vim.api.nvim_exec("Neotree focus filesystem left", true)
					end,
					["b"] = function()
						vim.api.nvim_exec("Neotree focus buffers left", true)
					end,
					["g"] = function()
						vim.api.nvim_exec("Neotree focus git_status left", true)
					end,
				},
			},
		})
		vim.keymap.set("n", "<C-b>", "<CMD>Neotree toggle<CR>", { desc = "toggle neotree" })
		vim.keymap.set("n", "<leader>nt", "<CMD>Neotree toggle<CR>", { desc = "toggle neotree." })
		vim.keymap.set("n", "<leader>nc", "<CMD>Neotree close<CR>", { desc = "close neotree." })
		vim.keymap.set("n", "<leader>nf", "<CMD>Neotree focus<CR>", { desc = "focus neotree." })
		vim.keymap.set("n", "<leader>ng", "<CMD>Neotree float git_status<CR>", { desc = "neotree git" })
	end,
}
