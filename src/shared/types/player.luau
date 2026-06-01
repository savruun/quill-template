<<<<<<< HEAD
const PLAYER_DATA_TEMPLATE = require('@shared/lib/data/playerDataTemplate')
const playerTypes = {}

export type PlayerData = typeof(PLAYER_DATA_TEMPLATE)
=======
const PLAYER_DATA_TEMPLATE = require('@shared/data/playerDataTemplate')
const playerTypes = {}

export type PlayerData = typeof(PLAYER_DATA_TEMPLATE)
export type SafePlayerData = PlayerData
>>>>>>> 1657481 (feat: update template)

return playerTypes
