gulp = require 'gulp'
gutil = require 'gulp-util'
# misc
cond  = require 'gulp-if'
clean = require 'gulp-clean'

# compilers
uglify = require 'gulp-uglify'
# lsc    = require 'gulp-livescript'
coffee = require 'gulp-coffee'

# connect = require 'gulp-connect'
plumber = require 'gulp-plumber'

gulp.task 'script', ->
  gulp.src 'coffee/**/*.coffee'
    .pipe(plumber())
    .pipe coffee() .on 'error', gutil.log
    # .pipe uglify()
    .pipe gulp.dest ''
    # .pipe connect.reload()

gulp.task 'watch', ->
  gulp.watch 'coffee/**/*.coffee', ['script']

gulp.task 'default', ['script', 'watch']
