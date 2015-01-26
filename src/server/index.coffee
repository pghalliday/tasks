q = require 'q'
path = require 'path'
MongoClient = require('mongodb').MongoClient
express = require 'express'
passport = require 'passport'
Api = require './api'

url = process.env.MONGODB_URL || 'mongodb://mongo:27017/tasks'
root = path.resolve path.join __dirname, '../client'
port = 5000

app = express()
app.use express.static root

auth = (request, response, next) ->
  if !request.isAuthenticated()
    response.sendStatus 401
  else
    next()

q()
  .then ->
    q.ninvoke MongoClient, 'connect', url
  .then (db) ->
    api = Api auth, db
    app.use '/api', api
    q.ninvoke app, 'listen', port
  .done()
