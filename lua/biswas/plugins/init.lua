return {

	{ "dstein64/vim-startuptime" },
	-- lsp
	{
		"vonheikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- lsp support
			{ "neovim/nvim-lspconfig" }, -- required
			{ -- optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "masonupdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- optional

			-- autocompletion
			{ "hrsh7th/nvim-cmp" }, -- required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- required
			{ "hrsh7th/cmp-cmdline" },
		},
	},
}
