return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({
						async = true,
						timeout_ms = 500,
						lsp_format = "fallback",
					})
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				jinja = { "djlint" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				tex = { "tex-fmt" },
				latex = { "tex-fmt" },
			},
			default_format_opts = {
				lsp_format = "never",
			},
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_format = "never",
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
