React     = require 'react'
{ Link }  = require 'react-router'

# Components
Counter   = require './Counter'

# Models
Cats      = require '../models/Cats'

module.exports = class Application extends React.Component
  constructor : (props) ->
    super props
    @state = cats: new Cats

  componentDidMount : ->
    { cats } = @state
    cats
      .fetch()
      .then =>
        @setState { cats }

  render  : ->
    <div>
      <h1>Welcome to the Application</h1>
      {
        if @state.cats.items?
          <ul>
            { for cat in @state.cats.items
              <li key={cat.slug}>
                <Link to={ "/welcome/#{cat.slug}" }>{ cat.name }</Link>
              </li>
            }
          </ul>
        else
          <p>Loading cats...</p>
      }
      <Counter />
      { @props.children or <p>Choose a cat</p> }
    </div>
