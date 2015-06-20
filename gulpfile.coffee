gulp       = require 'gulp'
browserify = require 'browserify'
reactify   = require 'coffee-reactify'
uglify     = require 'gulp-uglify'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
webserver  = require 'gulp-webserver'
stylus     = require 'gulp-stylus'
del        = require 'del'
sourcemaps = require 'gulp-sourcemaps'
{Readable} = require 'stream'

gulp.task 'scripts', ->
  { NODE_ENV } = process.env

  b = browserify
    entries   : './scripts/index.coffee'
    debug     : NODE_ENV is 'development'
    transform : reactify
    extensions: ['.coffee', '.cjsx']

  b.bundle()
    .on 'error', (error) ->
      console.trace error
    .pipe source 'bundle.js'
    .pipe buffer()
    .pipe gulp.dest 'build/frontend/scripts'

gulp.task 'assets', ->
  gulp
    .src './assets/**/*'
    .pipe gulp.dest 'build/frontend'

gulp.task 'clear', (done) ->
  del './build/**/*', done

gulp.task 'styles', ->
  { NODE_ENV } = process.env

  gulp
    .src './styles/main.styl'
    .pipe stylus compress: NODE_ENV isnt 'development'
    .pipe gulp.dest './build/frontend/styles'

gulp.task 'serve', (done) ->
  gulp
    .src 'build/frontend'
    .pipe webserver
      host      : '0.0.0.0'
      port      : 8020
      livereload: yes
      open      : 'http://localhost:8020/'

gulp.task 'build', gulp.series [
  'clear'
  gulp.parallel [
    'assets'
    'scripts'
    'styles'
  ]
]

gulp.task 'watch', (done) ->
  gulp.watch ['./scripts/**/*'],  gulp.series ['scripts']
  gulp.watch ['./assets/**/*'],   gulp.series ['assets']
  gulp.watch ['./styles/**/*'],   gulp.series ['styles']

  # It is never done :)

gulp.task 'develop', gulp.series [
  (done) ->
    process.env.NODE_ENV ?= 'development'
    do done
  'build'
  'serve'
  'watch'
]
