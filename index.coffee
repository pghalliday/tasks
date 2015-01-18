q = require 'q'
MongoClient = require('mongodb').MongoClient
url = 'mongodb://mongo:27017/tasks'
q()
  .then ->
    q.ninvoke MongoClient, 'connect', url
  .then (db) ->
    console.log 'Connected to database'
    q.ninvoke db, 'close'
  .done()
