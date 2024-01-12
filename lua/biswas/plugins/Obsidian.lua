return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		--config
		require("obsidian").setup({
			workspaces = {
				{
					name = "Program",
					path = "/mnt/docs/sync2/Program",
				},
				{
					name = "note",
					path = "/mnt/docs/sync2/Note",
				},
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "Note/dailies",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y-%m-%d",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = nil,
			},
			completion = {
				nvim_cmp = true,
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gd"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
			},

			disable_frontmatter = false,

			finder = "telescope.nvim",
			finder_mappings = {
				new = "<C-x>",
			},
		})
	end,
}
