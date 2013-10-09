(function () {
  'use strict';

  Muscle.CollectionView = Muscle.View.extend({
    addOne: function(model) {
      var modelView = new this.modelView({model: model});
      modelView.render();
      this.$el[this.renderMethod](modelView.el);
    },

    addAll: function() {
      this.collection.forEach(this.addOne, this);
    },

    render: function() {
      this.addAll();
      this.trigger('rendered');
    },

    remove: function(model) {
      model.destroy();
    },

    watcher: function() {
      Muscle.View.prototype.watcher.apply(this);
      this.collection.on('add', this.addOne, this);
      this.collection.on('reset', this.addAll, this);
      this.collection.on('reset', this.DOMControl, this);
      this.collection.on('remove', this.remove, this);
    }
  });
}());
