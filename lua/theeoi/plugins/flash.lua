return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			labels = "asdfghjkl",
			label = {
				uppercase = false,
			},
			search = {
				multi_window = false,
			},
			modes = {
				search = {
					enabled = true,
					highlight = {
						backdrop = false,
					},
				},
				char = {
					enabled = true,
					jump_labels = true,
					keys = { "f", "F", "t", "T" },
					label = {
						exclude = "",
					},
					highlight = {
						backdrop = false,
					},
				},
			},
		},
		config = function(_, opts)
			require("flash").setup(opts)

			local group = vim.api.nvim_create_augroup("FlashSearchRedraw", {
				clear = true,
			})
			vim.api.nvim_create_autocmd("CmdLineChanged", {
				group = group,
				desc = "Redraw Flash matches during search",
				callback = function()
					local cmdtype = vim.fn.getcmdtype()

					if cmdtype == "/" or cmdtype == "?" then
						vim.cmd.redraw()
					end
				end,
			})
		end,
	},
}
