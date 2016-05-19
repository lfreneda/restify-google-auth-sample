config = require './../../../config.json'
OAuth2 = require('googleapis').auth.OAuth2

module.exports = (req, res) ->

    oauth2Client = new OAuth2(config.CLIENT_ID, config.CLIENT_SECRET, config.REDIRECT_URL)
    authenticationUrl = oauth2Client.generateAuthUrl {
      access_type: 'offline', # 'online' (default) or 'offline' (gets refresh_token)
      scope: [
        'https://www.googleapis.com/auth/plus.me'
        'https://www.googleapis.com/auth/calendar'
      ] # If you only need one scope you can pass it as string
    }

    res.send authenticationUrl: authenticationUrl