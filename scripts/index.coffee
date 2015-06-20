React = require 'react'

class Application extends React.Component
  # The alternative is:
  # Application = React.createClass
  # This is going to be depreciated in favor of ES 6 classes
  # which are compatible with CoffeeScript implementation.
  # The difference is in mixin's support and auto-bindig.
  # SEE: https://medium.com/@dan_abramov/mixins-are-dead-long-live-higher-order-components-94a0d2f9e750
  # SEE: https://facebook.github.io/react/docs/reusable-components.html#mixins
  # SEE: https://github.com/usirin/coffee-react-class
  # SEE: https://github.com/brigand/react-mixin

  constructor: (props) ->
    super props
    # Also with plain JS class the initial state is set in constructor
    # No more stupid getInitialState method
    @state = count: 0

  greet   : (who) -> "Hello, #{who}!"


  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      <p>{ @greet "Katiusza" }</p>
      <a
        href    = '#click'
        onClick = { =>
          { count } = @state
          count += 1
          @setState { count }
        }
      >
        Clicked { @state.count } times
      </a>
    </div>

React.render <Application />, document.body
