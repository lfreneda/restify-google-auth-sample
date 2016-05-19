google = require 'googleapis'
config = require './../../config.json'
OAuth2 = google.auth.OAuth2
oauth2Client = new OAuth2(config.CLIENT_ID, config.CLIENT_SECRET, config.REDIRECT_URL)
request = require 'request'

module.exports =

  authenticateWithGoogle: (req, res, next) ->
    code = req.params.code
    oauth2Client.getToken code, (err, tokens) ->
      next.ifError err

      requestUrl = "https://www.googleapis.com/oauth2/v1/userinfo/?alt=json&access_token=#{tokens.access_token}"
      request { url: requestUrl }, (err, resp, body) ->
        next.ifError err
        res.send JSON.parse(body)

  authenticateRedirect: (req, res) ->

    scopes = [
      'https://www.googleapis.com/auth/plus.me'
      'https://www.googleapis.com/auth/calendar'
    ]

    url = oauth2Client.generateAuthUrl {
      access_type: 'offline', # 'online' (default) or 'offline' (gets refresh_token)
      scope: scopes # If you only need one scope you can pass it as string
    }

    res.send {
      authenticationUrl: url
    }