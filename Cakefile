[ { exec }, FileSystem ] = [ require('child_process'), require('fs') ]

task 'cucumber', 'run all features', (options) ->
  invoke 'cucumber:all'

task 'cucumber:all', 'run all features', (options) ->
  exec 'cucumber.js features/*.feature', (error, stdout, stderr) ->
    console.log stdout, stderr

task 'cucumber:wip', 'run wip features', (options) ->
  exec 'cucumber.js --tags @wip features/*.feature', (error, stdout, stderr) ->
    console.log stdout, stderr

task 'compile', 'compile coffee files to pkg', (options) ->
  exec 'coffee --compile --join pkg/erudite.js lib/**/*.coffee', (error, stdout, stderr) ->

task 'clear', 'clear the pkg directory', (options) ->
  FileSystem.unlinkSync "pkg/#{file}" for file in FileSystem.readdirSync 'pkg'

task 'spec', 'run all specs', (options) ->
  exec 'mocha --colors --require should --reporter spec spec/**/*_spec.coffee', (error, stdout, stderr) ->
    console.log stdout, stderr
