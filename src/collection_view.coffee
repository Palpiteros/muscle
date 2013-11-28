Muscle.CollectionView = Muscle.View.extend
  renderMethod: 'append',

  addOne: (model) -> 
    modelView = new @modelView({model: model})
    modelView.render()
    @$el[@renderMethod](modelView.el)

  addAll: ->
    @collection.forEach(@addOne, this)

  render: ->
    @addAll()
    @trigger('rendered')

  remove: (model) -> 
    model.destroy()

  watcher: ->
    Muscle.View.prototype.watcher.apply(this)
    @collection.on('add', @addOne, this)
    @collection.on('reset', @render, this)
    @collection.on('rendered', @DOMControl, this)
    @collection.on('remove', @remove, this)

