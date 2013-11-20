{exec} = require "child_process"

task 'compile', 'Compile project from src/*.coffee to tmp/*.js', ->
  exec 'coffee --compile --output tmp/ src/', (err, stdout, stderr) ->
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
