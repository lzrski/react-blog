React     = require 'react'
{ Link }  = require 'react-router'

module.exports = class Counter extends React.Component
  constructor: (props) ->
    super props
    # Also with plain JS class the initial state is set in constructor
    # No more stupid getInitialState method
    @state = count: 0

  render  : ->
    <button
      onClick = { =>
        { count } = @state
        count += 1
        @setState { count }
      }
    >
      Clicked { @state.count } times
    </button>
