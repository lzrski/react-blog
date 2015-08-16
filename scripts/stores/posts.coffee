Reflux  = require 'reflux'

module.exports = Reflux.createStore
  getInitialState : ->
    posts: [
      'george'
      'katiusza'
      'skubi'
      'hello'
    ]
