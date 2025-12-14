-- Functions in M can be 'required' by other files.
local M = {}

-- Return to working file if in netrw and always open netrw in the cwd
function M.OpenNetrw()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")

	if ft == "netrw" then
		vim.cmd("Rex")
	else
		local cwd = vim.fn.getcwd()
		vim.cmd("Ex" .. cwd)
		vim.cmd("Ntree" .. cwd)
	end
end

function M.NavArglist(count)
	local arglen = vim.fn.argc()
	if arglen == 0 then
		return
	end

	local next = (vim.fn.argidx() + count) % arglen
	if next < 0 then
		next = next + arglen
	end

	vim.cmd((next + 1) .. "argu")
end

function M.ArgsNavPrev()
	M.NavArglist(vim.v.count1 * -1)
	vim.cmd("silent args")
end
function M.ArgsNavNext()
	M.NavArglist(vim.v.count1)
	vim.cmd("silent args")
end

-- Return M so it can be 'required'
return M
