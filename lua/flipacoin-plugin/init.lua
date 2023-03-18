local M = {}

function M.flip()
	local coin = math.random(1, 2)
	local result = ""
	if coin == 1 then
		result = "heads(" .. coin .. ")"
	else
		result = "tails(" .. coin .. ")"
	end
	print("Flipped a coin: " .. result)
end

return M
