Muscle = window.Muscle = {}

Muscle.View = Backbone.View.extend
  initialize: ->
    @createTemplate()
    @watcher()
    @trigger('initialized')

  renderMethod: 'html'
  templateDir: 'app/templates/'

  render: (obj) ->
    @$el[@renderMethod](@template(obj))
    @trigger('rendered')

  watcher: ->
    @on('rendered', @DOMControl, this)

  createTemplate: ->
    if HandlebarsTemplates?
      @template = HandlebarsTemplates[@templateDir + @templateName]
    else
      @template = Handlebars.templates[@templateName + '.hbs']

  DOMControl: ->

