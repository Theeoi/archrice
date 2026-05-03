return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>ff",
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
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters.
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				jinja = { "djlint" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				tex = { "tex-fmt" },
				latex = { "tex-fmt" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "never",
			},
			-- Set up format-on-save
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_format = "never",
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
