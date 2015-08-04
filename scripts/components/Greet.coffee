React     = require 'react'

# Components
{ Link }  = require 'react-router'

# Models
Cat       = require '../models/Cat'

module.exports = class Greet extends React.Component
  @fetch = (params) ->
    cat = new Cat params.cat
    do cat.fetch # Return a promise that resolves to cat model

  constructor : (props, context) ->
    super props, context
    @state =
      cat   : props.route?.data or new Cat props.params.cat

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
