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
				lua = { "selene" },
				python = { "ruff_fix" },
			},
		},
		config = function()
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
