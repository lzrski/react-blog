Reflux    = require 'reflux'
# Actions
{
  getPosts
}         = require '../actions'
sys = require 'sys'
module.exports = Reflux.createStore
  init  : ->
    @listenTo getPosts, @onGetPosts

  fetch : ->
    if window?
      # This happens client side
      fetch '/data'
        .then (res) -> do res.json
        .then (posts) ->
          @state = { posts }
          Promise.resolve @state
        .catch (error) ->
          Promise.reject error


    else
      # This happens on the server
      @state = posts: [
        'Server'
        'Side'
        'Posts'
        'Awesome'
      ]
      Promise.resolve @state

  onGetPosts: ->
    @fetch()
      .then (state)   =>
        @trigger state
        getPosts.completed state
      .catch (error)  =>
        getPosts.failed error
