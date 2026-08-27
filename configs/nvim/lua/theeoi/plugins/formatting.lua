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
						lsp_format = "never",
					})
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		opts = function()
			local languages = require("theeoi.languages")
			return {
				formatters_by_ft = languages.formatters_by_ft,
				default_format_opts = {
					lsp_format = "never",
				},
				format_on_save = {
					async = false,
					timeout_ms = 500,
					lsp_format = "never",
				},
			}
		end,
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
