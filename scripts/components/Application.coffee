React     = require 'react'
{ Link }  = require 'react-router'

# Components
Counter   = require './Counter'

# Models
Cats      = require '../models/Cats'

module.exports = class Application extends React.Component
  constructor : (props) ->
    super props
    @state = cats: null

  componentDidMount : ->
    Cats.fetch().then (cats) => @setState { cats }

  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      {
        if @state.cats
          <ul>
            { for cat in @state.cats
              <li key={cat}><Link to={ "/welcome/#{cat}" }>{ cat }</Link></li>
            }
          </ul>
        else
          <p>Loading cats...</p>
      }
      <Counter />
      { @props.children or <p>Choose a cat</p> }
    </div>
