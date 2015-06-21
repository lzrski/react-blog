React = require 'react'

class Counter extends React.Component
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

class Greet extends React.Component
  @defaultProps :
    name: 'Kitty'

  render: ->
    <p>Hello, { @props.name }</p>

class Application extends React.Component
  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      <Counter />
      <Greet name="Katiusza" />
      <Greet name="George" />
      <Greet name="Skubi" />
    </div>


React.render <Application />, document.body
