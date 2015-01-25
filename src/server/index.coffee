q = require 'q'
http = require 'q-io/http'
apps = require 'q-io/http-apps'
path = require 'path'
MongoClient = require('mongodb').MongoClient
api = require './api'

url = process.env.DATABASE_URL || 'mongodb://mongo:27017/tasks'
console.log url
root = path.resolve path.join __dirname, '../client'
port = 5000

q()
  .then ->
    q.ninvoke MongoClient, 'connect', url
  .then (db) ->
    defaultRoute = apps.FileTree root
    branchRoutes =
      'api': api db
    server = http.Server apps.Branch branchRoutes, defaultRoute
    server.listen port
  .done()
