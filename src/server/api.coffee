express = require 'express'

module.exports = (auth, db) ->
  router = express.Router()
  router.use auth
  router.get '*', (request, response) ->
    response.send 'Hello, world!'
