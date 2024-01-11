return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		build = function()
			pcall(vim.cmd, "masonupdate")
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
}
