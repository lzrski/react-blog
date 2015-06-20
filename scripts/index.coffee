React = require 'react'

class Application extends React.Component
  greet   : (who) -> "Hello, #{who}!"
  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      <p>{ @greet "Katiusza" }</p>
    </div>

React.render <Application />, document.body
