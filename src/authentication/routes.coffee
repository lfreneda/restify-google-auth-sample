actions = require './actions'

module.exports =
  config: (server) ->
    server.post '/google-authenticate', actions.authenticateWithGoogle