return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>fl",
				function()
					require("lint").try_lint()
				end,
				mode = { "n" },
				desc = "Lint current file.",
			},
		},
		opts = {
			linters_by_ft = {
				lua = {}, -- Using LSP instead
				python = {}, -- Using LSP instead
				jinja = { "djlint" },
				tex = {}, -- Using LSP instead
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			lint.linters_by_ft = opts.linters_by_ft

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
