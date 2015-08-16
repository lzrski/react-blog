React     = require 'react'

# Components
{ Link }  = require 'react-router'

# Stores
store     = require '../stores/posts'

module.exports = class Application extends React.Component
  constructor : (props, context) ->
    super props, context
    @state = do store.getInitialState

  componentDidMount : ->
    console.log 'Subscribing to store'
    @unsubscribe = store.listen (data) -> @setState data

  componentWillUnmount: ->
    console.log 'Unsubscribing from store'
    do @unsubscribe

  render  : ->
    <div>
      <Link to = '/'><h1>React blog</h1></Link>
      {
        { posts } = @state

        <ul>{
          <li key = {id}>
            <Link to={ "/#{id}" }>{ post }</Link>
          </li> for post, id in posts
        }</ul> if posts?
      }
      { @props.children or <p>Please choose a post about a cat.</p> }
    </div>
