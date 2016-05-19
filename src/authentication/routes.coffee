actions = require './actions'

module.exports =
  config: (server) ->
    server.get '/google-redirect-and-authenticate', actions.authenticateRedirect
    server.get '/google-authenticate', actions.authenticateWithGoogle