return {
	{
		"mason-org/mason.nvim",
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

			-- LUA
			if vim.fn.executable("lua-language-server") == 1 then
				vim.lsp.config("lua_ls", {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					root_markers = { "init.lua" },
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})

				vim.lsp.enable("lua_ls")
			end

			-- PYTHON
			if vim.fn.executable("ruff") == 1 then
				vim.lsp.config("ruff", {
					cmd = { "ruff", "server" },
					filetypes = { "python" },
					root_markers = { "pyproject.toml" },
				})

				vim.lsp.enable("ruff")
			end

			-- PROSE / LATEX
			if vim.fn.executable("ltex-ls-plus") == 1 then
				vim.lsp.config("ltex_plus", {
					cmd = { "ltex-ls-plus" },
					filetypes = { "tex", "markdown", "text" },
					root_markers = {},
				})

				vim.lsp.enable("ltex_plus")
			end
		end,
	},
}
