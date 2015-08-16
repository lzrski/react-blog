module.exports =
  path        : '/'
  component   : require './components/Application'
  childRoutes : [
    path        :'/:id'
    component   : require './components/Post'
  ]
