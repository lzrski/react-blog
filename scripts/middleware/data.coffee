Express = require 'express'
glob    = require 'glob'
path    = require 'path'

router  = new Express.Router
cwd     = path.join process.cwd(), 'build/content/'

router.get '/', (req, res, done) ->
  glob '*.md', { cwd }, (error, files) ->
    if error then return done error
    res.json files.map (file) -> file.replace /.md$/, ''

router.use '/', Express.static cwd

module.exports = router
