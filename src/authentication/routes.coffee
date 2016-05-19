generateGoogleAuthenticationUrl = require './actions/generateGoogleAuthenticationUrl'
authenticateWithGoogle = require './actions/authenticateWithGoogle'

module.exports =
  config: (server) ->
    server.get '/google-generate-authenticate-url', generateGoogleAuthenticationUrl
    server.get '/google-authenticate', authenticateWithGoogle