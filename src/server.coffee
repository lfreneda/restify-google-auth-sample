restify = require 'restify'

server = restify.createServer {
  name: 'Restfiy google auth sample'
  version: '1.0.0'
}

server.pre restify.pre.sanitizePath()
server.use restify.acceptParser(server.acceptable)
server.use restify.dateParser()
server.use restify.queryParser()
server.use restify.bodyParser()
server.use restify.gzipResponse()
server.use restify.CORS()
server.use restify.fullResponse()

server.get '/', (req, res) -> res.send { app: server.name, version: server.version }

routes = [
  require './authentication/routes'
]
routes.forEach (route) -> route.config server

server.listen process.env.PORT or 9876, () ->
  console.log '%s is listening at %s', server.name, server.url
  console.log 'browse http://localhost:9876/google-redirect-and-authenticate :)'

