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

			-- Define and ser lsp keymaps for which-key.
			local lsp_keymaps = {
				{ "n", "gd", vim.lsp.buf.definition, "Go to definition" },
				{ "n", "grr", vim.lsp.buf.references, "Find references" },
				{
					"n",
					"gri",
					vim.lsp.buf.implementation,
					"Go to implementation",
				},
				{
					"n",
					"grt",
					vim.lsp.buf.type_definition,
					"Go to type definition",
				},
				{ "n", "grn", vim.lsp.buf.rename, "Rename symbol" },
				{
					{ "n", "x" },
					"gra",
					vim.lsp.buf.code_action,
					"Show code actions",
				},
				{ "n", "grx", vim.lsp.codelens.run, "Run code lens" },
				{
					"n",
					"gO",
					vim.lsp.buf.document_symbol,
					"Show document symbols",
				},
				{ "n", "K", vim.lsp.buf.hover, "Show hover documentation" },
			}
			for _, keymap in ipairs(lsp_keymaps) do
				vim.keymap.set(
					keymap[1],
					keymap[2],
					keymap[3],
					{ desc = keymap[4] }
				)
			end

			-- Ensure all packages defined in languages.lua are installed on
			-- start-up.
			local languages = require("theeoi.languages")
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = languages.mason,
				auto_update = false,
				run_on_start = true,
			})

			-- After update we also uninstall anything not on the list.
			local cleanup_group = vim.api.nvim_create_augroup(
				"mason_tools_cleanup",
				{ clear = true }
			)
			vim.api.nvim_create_autocmd("User", {
				group = cleanup_group,
				pattern = "MasonToolsUpdateCompleted",
				callback = function()
					mason_tool_installer.clean()
				end,
			})

			-- Enable all configured lsp servers.
			for server, config in pairs(languages.lsp) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
