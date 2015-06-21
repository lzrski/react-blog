module.exports =
  fetch: -> new Promise (resolve, reject) ->
    done = ->
      resolve ['Katiusza', 'George', 'Skubi']

    delay = 500 + Math.floor (Math.random() * 1000)
    console.log "Wait #{delay} for a list"
    setTimeout done, delay
