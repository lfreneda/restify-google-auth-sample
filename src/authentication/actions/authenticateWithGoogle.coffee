config = require './../../../config.json'
OAuth2 = require('googleapis').auth.OAuth2
request = require 'request'

module.exports = (req, res, next) ->
  
    oauth2Client = new OAuth2(config.CLIENT_ID, config.CLIENT_SECRET, config.REDIRECT_URL)
    oauth2Client.getToken req.params.code, (err, tokens) ->
      next.ifError err
      requestUrl = "https://www.googleapis.com/oauth2/v1/userinfo/?alt=json&access_token=#{tokens.access_token}"
      request { url: requestUrl }, (err, resp, body) ->
        next.ifError err
        res.send JSON.parse(body)