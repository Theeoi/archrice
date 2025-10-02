-- [[ Setting options ]] See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)
local opt = vim.opt

-- Print the relative line number in front of each line
opt.relativenumber = true
opt.number = true

-- Proper tabs and indentation!
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

opt.wrap = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Split to right and below
opt.splitright = true
opt.splitbelow = true

-- Highlight the line where the cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8
opt.sidescrolloff = 8

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
opt.confirm = true

-- NetRW Configuration
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_alto = 0
