gulp = require 'gulp'

# Tests the source code.
jasmine = require 'gulp-jasmine'
gulp.task('test', ->
  gulp.src('spec/**/*.coffee')
    .pipe(jasmine())
)

# Lints the source code.
coffeelint = require 'gulp-coffeelint'
gulp.task('lint', ->
  gulp.src(['**/*.coffee', '!node_modules/**/*.coffee'])
    .pipe(coffeelint('coffeelint.json'))
    .pipe(coffeelint.reporter())
)

# Compiles the source code.
coffee = require('gulp-coffee')
sourcemaps = require('gulp-sourcemaps')
gulp.task('compile', () ->
  gulp.src('src/**/*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee(bare: true))
    .pipe(sourcemaps.write('maps'))
    .pipe(gulp.dest('build'))
)

# Runs all of the gulp tasks.
gulp.task('default', ['lint', 'test', 'compile'])
