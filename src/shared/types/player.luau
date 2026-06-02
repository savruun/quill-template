const PLAYER_DATA_TEMPLATE = require('@shared/data/playerDataTemplate')
const playerTypes = {}

export type PlayerData = typeof(PLAYER_DATA_TEMPLATE)
export type SafePlayerData = PlayerData

return playerTypes
