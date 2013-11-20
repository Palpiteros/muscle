{exec} = require "child_process"

task 'compile', 'Build project from src/*.coffee to tmp/*.js', ->
  exec 'coffee --compile --output tmp/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
