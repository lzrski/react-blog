module.exports =
  path        : '/'
  component   : require './components/Application'
  childRoutes : [
    path        :'/welcome/:cat'
    component   : require './components/Greet'
  ]
