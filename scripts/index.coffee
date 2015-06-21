React       = require 'react'
{
  Router
  Route
}           = require 'react-router'
HashHistory = require 'react-router/lib/HashHistory'

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
  render: ->
    <p>Hello, { @props.params?.cat or 'Kitty' }</p>

class Application extends React.Component
  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      <Counter />
      { @props.children or <p>Choose a cat</p> }
    </div>

router = (
  <Router history={new HashHistory}>
    <Route path='/' component={Application}>
      <Route path='/welcome/:cat' component={Greet} />
    </Route>
  </Router>
)
React.render router, document.body
