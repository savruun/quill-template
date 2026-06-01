local DictUtility = {}

function DictUtility.size(dict: { [any]: any }): number
	local counter = 0

	for _, __ in dict do
		counter += 1
	end

	return counter
end

return DictUtility
