return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for icons
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Fuzzyfind files.",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Fuzzyfind buffers.",
			},
			{
				"<leader>fa",
				function()
					require("fzf-lua").args()
				end,
				desc = "Fuzzyfind arguments.",
			},
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Fuzzyfind text.",
			},
			{
				"<leader>fr",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume previous fuzzyfind.",
			},
			{
				"<leader>f?",
				function()
					require("fzf-lua").builtin()
				end,
				desc = "List all fuzzyfinders.",
			},
		},
		opts = {
			fzf_colors = true,
		},
	},
}
