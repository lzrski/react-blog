{
  titleize
  slugify
} = require 'underscore.string'

module.exports = class Cat
  constructor : (slug) ->
    @slug = slugify slug
    console.log "New cat model (#{@slug})"

  fetch: -> new Promise (resolve, reject) =>
    # Let's simulate an async call
    done = =>
      if @slug in ['katiusza', 'george', 'skubi']
        @name = titleize @slug
        resolve @
      else
        reject new Error "No such cat #{@slug}"

    delay = 500 + Math.floor (Math.random() * 1000)
    console.log "Wait #{delay} for a cat"
    setTimeout done, delay
