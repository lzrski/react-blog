# This is the backend application. It does not go into bundle.

Express     = require 'express'
fs          = require 'fs'

# For server-side rendering
# TODO: Move to own middleware
React       = require 'react'
{ Router }  = require 'react-router'
# TODO: Fix rack/react-router  #1331, #1344, #1367 by updating docs
Location    = require 'react-router/lib/Location'
routes      = require './routes'

app = new Express

app.use Express.static 'build/frontend/'
app.get '*', (req, res, done) ->
  # TODO: Disassable the pyramid of doom
  location = new Location req.path, req.query
  Router.run  routes, location, (error, state, transition) ->
    console.dir state # TODO: What excacly to do with that?
    rendered = React.renderToString <Router {...state} />
    fs.readFile 'build/frontend/index.html', 'utf-8', (error, html) ->
      if error then return done error
      html = html.replace '<!-- React components will be rendered here -->', rendered
      res.send html

app.listen 8020
