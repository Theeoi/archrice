-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.opt.clipboard:append("unnamedplus")
	end,
})

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Make netrw cd motion change working directory globally and set the netrw tree root
local aug = vim.api.nvim_create_augroup("NetrwGlobalCD", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	group = aug,
	callback = function()
		vim.keymap.set("n", "cd", function()
			local dir = vim.b.netrw_curdir
			if dir and dir ~= "" then
				vim.cmd("cd" .. vim.fn.fnameescape(dir))
				vim.cmd("Ntree" .. vim.fn.fnameescape(dir))
			end
		end, { buffer = true, noremap = true })
	end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`
