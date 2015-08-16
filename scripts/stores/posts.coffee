Reflux    = require 'reflux'
# Actions
{
  getPosts
}         = require '../actions'

module.exports = Reflux.createStore
  init  : ->
    @listenTo getPosts, @onGetPosts

  onGetPosts: ->
    if window?
      # This happens client side
      getPosts.completed posts: [
        'Client'
        'Side'
        'Posts'
      ]
    else
      # This happens on the client
      getPosts.completed posts: [
        'Server'
        'Side'
        'Posts'
        'Awesome'
      ]
