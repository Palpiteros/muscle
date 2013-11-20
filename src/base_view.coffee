class Muscle.View extends Backbone.View
  initialize: ->
    @createTemplate();
    @watcher();
    @trigger('initialized');

  renderMethod: 'html',

  render: (obj) ->
    @$el[@renderMethod](@template(obj));
    @trigger('rendered');

  watcher: ->
    @on('rendered', @DOMControl, this);

  createTemplate: ->
    @template = HandlebarsTemplates['app/templates/' + @templateName];

    DOMControl: ->

