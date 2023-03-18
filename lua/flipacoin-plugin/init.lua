local M = {}

local function findConflicts(b)
	local marks = {}
	local buffer = vim.api.nvim_buf_get_lines(b, 0, -1, false)
	for ln, l in pairs(buffer) do
		if l:match("<<<<<<<") then
			marks[#marks + 1] = { ln, ln, ln }
		elseif l:match("=======") then
			marks[#marks][2] = ln
		elseif l:match(">>>>>>>") then
			marks[#marks][3] = ln
		end
	end
	return marks
end

function M.next()
	local b = vim.api.nvim_get_current_buf()
	local marks = findConflicts(b)
	if #marks == 0 then
		print("No conflicts. All good")
		return
	end
	vim.cmd(":" .. marks[1][1])
end

function M.flip()
	local b = vim.api.nvim_get_current_buf()
	local marks = findConflicts(b)
	if #marks == 0 then
		print("No conflicts. All good")
		return
	end

	local res = {}
	if math.random(1, 2) == 1 then
		res = vim.api.nvim_buf_get_lines(b, marks[1][1], marks[1][2] - 1, false)
		print("HEADS")
	else
		res = vim.api.nvim_buf_get_lines(b, marks[1][2], marks[1][3] - 1, false)
		print("TAILS")
	end

	vim.api.nvim_buf_set_lines(b, marks[1][1] - 1, marks[1][3], true, res)
end

return M
