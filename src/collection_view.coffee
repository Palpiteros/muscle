class Muscle.CollectionView extends Muscle.View
  renderMethod: 'append',

  addOne: (model) -> 
    var modelView = new @modelView({model: model});
    modelView.render();
    @$el[@renderMethod](modelView.el);

  addAll: ->
    @collection.forEach(@addOne, this);

  render: ->
    @addAll();
    @trigger('rendered');

  remove: (model) -> 
    model.destroy();

  watcher: ->
    Muscle.View.prototype.watcher.apply(this);
    @collection.on('add', @addOne, this);
    @collection.on('reset', @addAll, this);
    @collection.on('reset', @DOMControl, this);
    @collection.on('remove', @remove, this);

