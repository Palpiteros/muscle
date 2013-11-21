server = (require 'karma').server
{exec} = require "child_process"

task 'compile', 'Compile project from src/*.coffee to tmp/*.js', ->
  exec 'coffee --compile --output tmp/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'compile:handlebars', 'Compile hadlebars test templates to tmp/templates', ->
  exec 'handlebars tests/templates/* -f tmp/templates_test.js', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'build', 'Build project to lib/muscle.js', ->
  exec 'coffee --join tmp/muscle.js --compile src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'release', 'Build a release of the project to muscle.js', ->
  exec 'coffee --join muscle.js --compile src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'test', ->
  invoke 'build'
  invoke 'compile:handlebars'
  config = "#{__dirname}/tests/karma.conf.coffee"
  server.start configFile: config, (exitCode) ->
    console.log "Karma has exited with #{exitCode}"
    process.exit exitCode
