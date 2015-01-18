gulp = require 'gulp'
gulpUtil = require 'gulp-util'
coffee = require 'gulp-coffee'
clean = require 'gulp-clean'

gulp.task 'dist', ['dist:server', 'dist:client']

gulp.task 'dist:server', ['clean'], ->
  gulp.src('./src/server/**/*.coffee')
    .pipe(
      coffee
        bare: true
    )
    .pipe(gulp.dest './dist/server/')

gulp.task 'dist:client', ['dist:client:coffee', 'dist:client:html'], ->

gulp.task 'dist:client:coffee', ['clean'], ->
  gulp.src('./src/client/coffee/**/*.coffee')
    .pipe(
      coffee
        bare: true
    )
    .pipe(gulp.dest './dist/client/js/')

gulp.task 'dist:client:html', ['clean'], ->
  gulp.src('./src/client/**/*.html')
    .pipe(gulp.dest './dist/client/')

gulp.task 'clean', ->
  gulp.src('dist')
    .pipe(clean())
