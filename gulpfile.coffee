gulp = require 'gulp'
gulpUtil = require 'gulp-util'
coffee = require 'gulp-coffee'
clean = require 'gulp-clean'
nodemon = require 'gulp-nodemon'

serverSrc = './src/server/**/*.coffee'
clientCoffeeSrc = './src/client/coffee/**/*.coffee'
clientHtmlSrc = './src/client/**/*.html'
clientVendorSrc = './node_modules/angular/angular.min.js'

src = [
  serverSrc
  clientCoffeeSrc
  clientHtmlSrc
  clientVendorSrc
]

gulp.task 'develop', ['build'], ->
  gulp.watch src, ['build']
  nodemon
    script: './build/server/index.js'
    watch: './build/server'
    ext: 'js'

gulp.task 'build', ['build:server', 'build:client']

gulp.task 'build:server', ['clean'], ->
  gulp.src(serverSrc)
    .pipe(
      coffee
        bare: true
    )
    .pipe(gulp.dest './build/server/')

gulp.task 'build:client', ['build:client:coffee', 'build:client:html', 'build:client:vendor'], ->

gulp.task 'build:client:coffee', ['clean'], ->
  gulp.src(clientCoffeeSrc)
    .pipe(
      coffee
        bare: true
    )
    .pipe(gulp.dest './build/client/js/')

gulp.task 'build:client:html', ['clean'], ->
  gulp.src(clientHtmlSrc)
    .pipe(gulp.dest './build/client/')

gulp.task 'build:client:vendor', ['clean'], ->
  gulp.src(clientVendorSrc)
    .pipe(gulp.dest './build/client/vendor/')

gulp.task 'clean', ->
  gulp.src('build')
    .pipe(clean())
