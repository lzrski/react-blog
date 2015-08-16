Reflux    = require 'reflux'
# Actions
{
  getPosts
}         = require '../actions'

module.exports = Reflux.createStore
  init  : ->
    @listenTo getPosts, @onGetPosts

  fetch : ->
    if window?
      # This happens client side
      @state =  posts: [
        'Client'
        'Side'
        'Posts'
      ]
      Promise.resolve @state
    else
      # This happens on the client
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
