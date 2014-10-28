gulp = require 'gulp'
gutil = require 'gulp-util'
# compilers
coffee = require 'gulp-coffee'

plumber = require 'gulp-plumber'
mocha = require 'gulp-mocha'

gulp.task 'script', ->
  gulp.src 'coffee/**/*.coffee'
    .pipe(plumber())
    .pipe coffee() .on 'error', gutil.log
    .pipe gulp.dest ''

gulp.task 'watch', ->
  gulp.watch 'coffee/**/*.coffee',  ['script']

gulp.task 'test_watch', ->
  gulp.watch 'test/**/*.coffee', ['test']

gulp.task 'test',->
  gulp.src 'test/**/*.coffee',{read:false}
  .pipe plumber()
  .pipe mocha(reporter: 'spec')

gulp.task 'default', ['script', 'watch','test_watch']
