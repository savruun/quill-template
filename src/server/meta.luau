const charm = require('@pkg/charm')
const playerTypes = require('@types/player')

type MetaData = {
<<<<<<< HEAD
  players: { [number]: charm.Atom<playerTypes.PlayerData> },
=======
  players: { [number]: { data: charm.Atom<playerTypes.PlayerData> } },
>>>>>>> 1657481 (feat: update template)
  server: {}
}

const metadata: MetaData = {
  players = {},
  server = {}
}

return metadata
