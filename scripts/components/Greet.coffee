React     = require 'react'
{ Link }  = require 'react-router'

# Models
Cat       = require '../models/Cat'

module.exports = class Greet extends React.Component
  constructor : (props) ->
    super props
    @state =
      cat   : new Cat props.params.cat

  update: (slug) ->
    slug ?= @props.params.cat
    cat = new Cat slug
    @setState { cat, error: null }
    cat
      .fetch()
      .then => @setState { cat }
      .catch (error) => @setState { error }

  componentDidMount : ->
    @update @props.params.cat

  componentWillUpdate : (props, state) ->
    if props.params.cat isnt @props.params.cat then @update props.params.cat

  render: ->
    { error, cat } = @state
    <div>
      {
        if error
          <div>
            <strong>{ error.message }</strong>
          </div>
        else if cat.name?
          <div>
            <p>
              Hello, { cat.name }!
            </p>
            <button onClick = { => do @update }>
              reload
            </button>
          </div>
        else
          <p>Please wait for the cat...</p>
      }
    </div>
