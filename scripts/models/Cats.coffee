{ slugify } = require 'underscore.string'

module.exports = class Cats
  constructor : ->
    console.log "New cats collection"

  fetch: -> new Promise (resolve, reject) =>
    # Let's simulate an async call
    done = =>
      @items = [ 'Katiusza', 'George', 'Skubi'].map (item) ->
        name: item
        slug: slugify item

      resolve @

    delay = 500 + Math.floor (Math.random() * 1000)
    console.log "Wait #{delay} for a list"
    setTimeout done, delay
