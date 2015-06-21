React     = require 'react'
{ Link }  = require 'react-router'

# Models
Cat       = require '../models/Cat'

module.exports = class Greet extends React.Component
  constructor : (props) ->
    super props
    @state = cat: null

  update: (name) ->
    @setState cat: null
    Cat
      .fetch name
      .then (cat) => @setState { cat }

  componentDidMount : ->
    @update @props.params.cat

  componentWillUpdate : (props, state) ->
    if props.params.cat isnt @props.params.cat then @update props.params.cat

  render: ->
    { cat } = @state
    if cat? then <p>Hello, { cat }!</p>
    else <p>Please wait for the cat...</p>
