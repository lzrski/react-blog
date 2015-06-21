module.exports =
  fetch: (name) -> new Promise (resolve, reject) ->
    done = ->
      if name.toLowerCase() in ['katiusza', 'george', 'skubi']
        resolve "Cat's name is #{name.toUpperCase()}"
      else
        reject new Error 'No such cat'

    delay = 500 + Math.floor (Math.random() * 1000)
    console.log "Wait #{delay} for a cat"
    setTimeout done, delay
