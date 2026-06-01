const Players = game:GetService('Players')
const playerUtility = {}

--[[
  Runs a callback for all current and future players
]]
function playerUtility:forEachPlayer(callback: (Player) -> ()): RBXScriptConnection
	for _, player in Players:GetPlayers() do
		callback(player)
	end

	return Players.PlayerAdded:Connect(callback)
end

<<<<<<< HEAD
return playerUtility
=======
return playerUtility
>>>>>>> 1657481 (feat: update template)
