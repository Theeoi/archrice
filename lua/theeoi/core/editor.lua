-- Nvim configs related to the editor and its behaviour

-- Setting local varaibles for ease-of-use
local opt = vim.opt
local keymap = vim.keymap

-- Proper tabs and indentation!
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

-- Do not wrap lines by default
opt.wrap = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
opt.confirm = true

-- automatically turn off search highlighting after 'updatetime' and when going to insert mode
vim.cmd.packadd("nohlsearch")

-- Using space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use jk to exit insert mode
keymap.set({ "i" }, "jk", "<Esc>")

-- Quickly save
keymap.set({ "n" }, "<leader>w", "<cmd>w<CR>", { desc = "Save current file." })
keymap.set({ "n" }, "<leader>W", "<cmd>wq<CR>", { desc = "Save and close current file." })

-- Quickly quit
keymap.set({ "n" }, "<leader>Q", "<cmd>q<CR>", { desc = "Close the current buffer." })

-- Use <Esc> to exit terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Optionally use shift+4 instead of AltGr+4
keymap.set({ "n", "o", "v" }, "¤", "$")

-- Nice searching
keymap.set({ "n" }, "//", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights." })
keymap.set({ "n" }, "n", "nzz")
keymap.set({ "n" }, "N", "Nzz")

-- Reselect visual selection after indenting
keymap.set({ "v" }, "<", "<gv")
keymap.set({ "v" }, ">", ">gv")

-- Use 'cd' for viewing code diagnostics
keymap.set({ "n" }, "<leader>cd", function()
	vim.diagnostic.open_float({ scope = "cursor", source = true })
end, { desc = "Show diagnostic under cursor." })

keymap.set({ "n" }, "<leader>cD", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Show buffer diagnostics." })

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
