-- Nvim configs related to navigation

-- Setting local variables for ease-of-use
local opt = vim.opt
local keymap = vim.keymap
local M = {}

-- Split to right and below
opt.splitright = true
opt.splitbelow = true

-- NetRW Configuration
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_alto = 0

-- Return to working file if in netrw and always open netrw in the cwd
function M.OpenNetrw()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")

	if ft == "netrw" then
		vim.cmd("Rex")
	else
		local cwd = vim.fn.getcwd()
		vim.cmd("Ex" .. vim.fn.fnameescape(cwd))
		vim.cmd("Ntree" .. vim.fn.fnameescape(cwd))
	end
end

-- Navigation in nvim built-in arglist
function M.NavArglist(count)
	local arglen = vim.fn.argc()
	if arglen == 0 then
		return
	end

	local next = (vim.fn.argidx() + count) % arglen
	if next < 0 then
		next = next + arglen
	end

	vim.cmd((next + 1) .. "argument")
end

function M.ArgsNavPrev()
	M.NavArglist(vim.v.count1 * -1)
	vim.cmd("silent args")
end
function M.ArgsNavNext()
	M.NavArglist(vim.v.count1)
	vim.cmd("silent args")
end

-- Navigate visual lines when wrap is on
keymap.set("n", "j", function()
	if vim.v.count == 0 then
		return vim.wo.wrap and "gj" or "j"
	end
	return "j"
end, { expr = true })

keymap.set("n", "k", function()
	if vim.v.count == 0 then
		return vim.wo.wrap and "gk" or "k"
	end
	return "k"
end, { expr = true })

-- Open netrw explorer in current buffer
keymap.set({ "n" }, "<leader>e", M.OpenNetrw, { desc = "Open NetRW in the current split." })

-- Splitting windows and using tabs/buffers/args
keymap.set("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split." })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab." })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab." })

keymap.set("n", "<leader>bb", "<cmd>buffers<CR>:b<space>", { desc = "List and pick current buffers." })

keymap.set("n", "<leader>as", "<C-L><cmd>args<CR>", { desc = "Show args list." })
keymap.set(
	"n",
	"<leader>aa",
	"<cmd>$argadd %<bar>argdelete<bar>args<CR>",
	{ desc = "Add current buffer to args list." }
)
keymap.set("n", "<leader>ad", "<cmd>argdelete %<bar>args<CR>", { desc = "Delete selected arg." })
keymap.set("n", "<leader>ac", "<cmd>%argdelete<CR><C-L>", { desc = "Clear args list." })
keymap.set("n", "<leader>ah", M.ArgsNavPrev)
keymap.set("n", "<leader>aH", "<cmd>first<bar>args<CR><Esc>")
keymap.set("n", "<leader>al", M.ArgsNavNext)
keymap.set("n", "<leader>aL", "<cmd>last<bar>args<CR><Esc>")

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

-- Return M so it can be 'required'
return M
