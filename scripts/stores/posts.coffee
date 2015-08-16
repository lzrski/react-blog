Reflux    = require 'reflux'
# Actions
{
  getPosts
}         = require '../actions'
fetch     = window?.fetch or require 'node-fetch'
URL       = require 'url'

module.exports = Reflux.createStore
  init  : ->
    @listenTo getPosts, @onGetPosts

  fetch : ->
    url = URL.parse '/data'
    unless window?
      # This happens on the server
      url.protocol  = 'http'
      url.hostname  = 'localhost'
      url.port      = 8020

    fetch URL.format url
      .then (res) -> do res.json
      .then (posts) ->
        @state = { posts }
        Promise.resolve @state
      .catch (error) ->
        Promise.reject error

  onGetPosts: ->
    @fetch()
      .then (state)   =>
        @trigger state
        getPosts.completed state
      .catch (error)  =>
        getPosts.failed error
