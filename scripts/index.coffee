React = require 'react'

Application = React.createClass
  render  : ->
    <h1>Welcome to the Application</h1>

React.render <Application />, document.body
