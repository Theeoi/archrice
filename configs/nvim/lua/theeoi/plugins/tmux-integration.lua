return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<A-h>", "<cmd>TmuxNavigateLeft<CR>", mode = "n", desc = "Navigate to the left pane." },
			{ "<A-j>", "<cmd>TmuxNavigateDown<CR>", mode = "n", desc = "Navigate to the lower pane." },
			{ "<A-k>", "<cmd>TmuxNavigateUp<CR>", mode = "n", desc = "Navigate to the upper pane." },
			{ "<A-l>", "<cmd>TmuxNavigateRight<CR>", mode = "n", desc = "Navigate to the right pane." },

			{ "<A-h>", "<Esc><cmd>:TmuxNavigateLeft<CR>", mode = "i", desc = "Navigate to the left pane." },
			{ "<A-j>", "<Esc><cmd>:TmuxNavigateDown<CR>", mode = "i", desc = "Navigate to the lower pane." },
			{ "<A-k>", "<Esc><cmd>:TmuxNavigateUp<CR>", mode = "i", desc = "Navigate to the upper pane." },
			{ "<A-l>", "<Esc><cmd>:TmuxNavigateRight<CR>", mode = "i", desc = "Navigate to the right pane." },

			{
				"<A-h>",
				"<C-\\><C-n><cmd>:TmuxNavigateLeft<CR>",
				mode = "t",
				desc = "Navigate to the left pane.",
			},
			{
				"<A-j>",
				"<C-\\><C-n><cmd>:TmuxNavigateDown<CR>",
				mode = "t",
				desc = "Navigate to the lower pane.",
			},
			{
				"<A-k>",
				"<C-\\><C-n><cmd>:TmuxNavigateUp<CR>",
				mode = "t",
				desc = "Navigate to the upper pane.",
			},
			{
				"<A-l>",
				"<C-\\><C-n><cmd>:TmuxNavigateRight<CR>",
				mode = "t",
				desc = "Navigate to the right pane.",
			},
		},
	},
}
