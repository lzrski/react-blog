# This is the backend application. It does not go into bundle.

Express = require 'express'
fs      = require 'fs'

app = new Express

app.use Express.static 'build/frontend/'
app.get '*', (req, res, done) ->
  fs.readFile 'build/frontend/index.html', 'utf-8', (error, html) ->
    if error then return done error
    res.send html

app.listen 8020
