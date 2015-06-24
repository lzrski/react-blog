React     = require 'react'
{ Link }  = require 'react-router'

# Components
Counter   = require './Counter'

# Models
Cats      = require '../models/Cats'

module.exports = class Application extends React.Component
  constructor : (props) ->
    super props
    @state =
      # Cats collection can be given by router in props
      cats: props.route?.data or new Cats

  @fetch = (params) ->
    console.log 'Fetching the list of cats'
    console.dir params
    cats = new Cats
    do cats.fetch # Return a promise that resolves to cats collection

  componentDidMount : ->
    { cats } = @state
    # TODO: Only fetch if not already there. It might have been fetch by server.
    cats
      .fetch()
      .then =>
        @setState { cats }

  render  : ->
    console.log "Props of application"
    console.dir @props

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
