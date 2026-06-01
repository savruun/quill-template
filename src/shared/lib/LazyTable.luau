const function LazyTable<T>(callback: (table: T) -> ()): T
	local table = {} :: any
	callback(table)

	return table
end

return LazyTable
