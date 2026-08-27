return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local languages = require("theeoi.languages")
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = languages.mason,
				auto_update = false,
				run_on_start = true,
			})

			local cleanup_group = vim.api.nvim_create_augroup("mason_tools_cleanup", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = cleanup_group,
				pattern = "MasonToolsUpdateCompleted",
				callback = function()
					mason_tool_installer.clean()
				end,
			})

			for server, config in pairs(languages.lsp) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
