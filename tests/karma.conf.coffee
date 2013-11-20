# Karma configuration

module.exports = (config) ->
  config.set
    # base path, that will be used to resolve files and exclude
    basePath: '../'

    # list of files / patterns to load in the browser
    files: [
      'tests/vendor/jquery.js'
      'tests/vendor/underscore.js'
      'tests/vendor/backbone.js'
      'tests/vendor/handlebars.runtime.js'
      'tmp/templates_test.js'
      'tmp/muscle.js'

      'tests/vendor/chai.js'
      'tests/vendor/sinon.js'
      'tests/vendor/chai-jquery.js'
      'tests/vendor/chai-changes.js'
      'tests/vendor/chai-backbone.js'
      'tests/vendor/sinon-chai.js'

      'tests/helpers.coffee'
      'tests/**/*_test.coffee'
    ]

    # web server port
    port: 8080

    # cli runner port
    runnerPort: 9100

    # enable / disable colors in the output (reporters and logs)
    colors: yes

    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: no

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari
    # - PhantomJS
    browsers: ['PhantomJS']

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: yes

    # compile coffee scripts
    preprocessors: '**/*.coffee': 'coffee'

    frameworks: ['mocha']

    plugins: [
      'karma-mocha',
      'karma-coffee-preprocessor',
      'karma-phantomjs-launcher',
      'karma-chrome-launcher',
      'karma-firefox-launcher',
      'karma-safari-launcher'
    ]

