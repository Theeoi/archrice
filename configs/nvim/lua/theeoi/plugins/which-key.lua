return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>a", group = "Arguments" },
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Code" },
				{ "<leader>s", group = "Splits" },
				{ "<leader>t", group = "Tabs" },
				{ "gq", desc = "Format with formatexpr" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer-local keymaps",
			},
		},
	},
}
