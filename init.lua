-- Setting local variables for ease-of-use
local opt = vim.opt
local keymap = vim.keymap
local obkeymap = vim.obsidian.keymap

-- Using space as leader
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Split to right and below
opt.splitright = true
opt.splitbelow = true

-- Quickly save
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file." })
keymap.set("n", "<leader>W", ":wq<CR>", { desc = "Save and close current file." })

-- Quickly quit
keymap.set("n", "<leader>Q", ":q<CR>", { desc = "Close the current pane." })

-- Open explorer. (Find files with <leader>ff)
keymap.set("n", "<leader>e", ":explorer<CR>", { desc = "Reveal file in explorer." })

-- Toggle undotree.
keymap.set("n", "<leader>u", ":UndoTreeToggle<CR>", { desc = "Toggle Undotree." })

-- Splitting windows and using tabs/buffers
obkeymap.set("<leader>sl", ":vsplit", { desc = "Split window vertically." })
obkeymap.set("<leader>sj", ":split", { desc = "Split window horizontally." })
obkeymap.set("<leader>sx", ":q", { desc = "Close current split." })
keymap.set("n", "<leader>sl", ":vsplit<CR>", { desc = "Split window vertically." })
keymap.set("n", "<leader>sj", ":split<CR>", { desc = "Split window horizontally." })
keymap.set("n", "<leader>sx", ":q<CR>", { desc = "Close current split." })

vim.api.nvim_create_user_command("NewTabPicker", function()
	vim.obsidian.run_command("workspace:new-tab")

	vim.schedule(function()
		vim.obsidian.pick("files")
	end)
end, {})

obkeymap.set("<leader>tn", ":NewTabPicker", { desc = "Pick file in new tab." })
obkeymap.set("<leader>tx", ":obcommand workspace:close", { desc = "Close current tab." })
obkeymap.set("<leader>tl", ":obcommand workspace:next-tab", { desc = "Go to next tab." })
obkeymap.set("<leader>th", ":obcommand workspace:previous-tab", { desc = "Go to previous tab." })
keymap.set("n", "<leader>tn", ":NewTabPicker<CR>", { desc = "Pick file in new tab." })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tl", ":nexttab<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>th", ":prevtab<CR>", { desc = "Go to previous tab." })

-- Focus splits. Regular keybinds solve it outside of editor.
keymap.set("n", "<A-h>", ":focuspaneleft<CR>", { desc = "Focus pane left." })
keymap.set("n", "<A-j>", ":focuspanedown<CR>", { desc = "Focus pane down." })
keymap.set("n", "<A-k>", ":focuspaneup<CR>", { desc = "Focus pane up." })
keymap.set("n", "<A-l>", ":focuspaneright<CR>", { desc = "Focus pane right." })
