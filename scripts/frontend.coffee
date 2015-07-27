# This is the frontend application. It's a bundle entry point.

React       = require 'react'
{ Router }  = require 'react-router'
History     = require 'react-router/lib/BrowserHistory'

routes      = require './routes'

router = <Router history = {new History} children = { routes }/>
React.render router, document.querySelector '#app-container'
