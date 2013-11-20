class Muscle.ModelView extends Muscle.View
  remove: ->
    @$el.remove();
    @trigger('removed');

  render: ->
    Muscle.View.prototype.render.apply(this, [@model.toJSON()]);

  watcher: ->
    Muscle.View.prototype.watcher.apply(this);
    @model.on('change', @render, this);
    @model.on('destroy', @remove, this);
