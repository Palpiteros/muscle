(function () {
  'use strict';

  Muscle.ModelView = Muscle.View.extend({
    remove: function() {
      this.$el.remove();
      this.trigger('removed');
    },

    render: function() {
      Muscle.View.prototype.render.apply(this, [this.model.toJSON()]);
    },

    watcher: function() {
      Muscle.View.prototype.watcher.apply(this);
      this.model.on('change', this.render, this);
      this.model.on('destroy', this.remove, this);
    }
  });
}());
