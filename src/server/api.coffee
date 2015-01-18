apps = require 'q-io/http-apps'

module.exports = (db) ->
  (request) ->
    apps.ok 'Hello, world!'
