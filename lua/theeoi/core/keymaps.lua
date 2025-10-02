local funcs = require("theeoi.core.functions")
-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- Use jk to exit insert mode
keymap.set({ "i" }, "jk", "<Esc>")

-- Quickly save
keymap.set({ "n" }, "<leader>w", "<cmd>w<CR>", { desc = "Save current file." })
keymap.set({ "n" }, "<leader>W", "<cmd>wq<CR>", { desc = "Save and close current file." })

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

-- Open netrw explorer in current buffer
keymap.set({ "n" }, "<leader>e", funcs.OpenNetrw, { desc = "Open NetRW in the current split." })

-- Splitting windows and using tabs/buffers
keymap.set("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab." })

keymap.set("n", "<leader>bb", "<cmd>buffers<CR>:b<space>", { desc = "List and pick current buffers." })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
keymap.set({ "n" }, "<A-h>", "<C-w>h")
keymap.set({ "n" }, "<A-j>", "<C-w>j")
keymap.set({ "n" }, "<A-k>", "<C-w>k")
keymap.set({ "n" }, "<A-l>", "<C-w>l")
