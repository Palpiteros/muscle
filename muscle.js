(function() {
  var Muscle = {};

  // Muscle base view

  Muscle.View = Backbone.View.extend({
    initialize: function() {
      this.createTemplate();
      this.watcher();
      this.trigger('initialized');
    },

    renderMethod: 'html',

    render: function(obj) {
      this.$el[this.renderMethod](this.template(obj));
      this.trigger('rendered');
    },

    watcher: function() {
      this.on('rendered', this.DOMControl, this);
    },

    createTemplate: function() {
      this.template = HandlebarsTemplates['app/templates/' + this.templateName];
    },

    DOMControl: function() {}
  });

  // Muscle model view
  
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

  // Muscle collection view
  
  Muscle.CollectionView = Muscle.View.extend({
    renderMethod: 'append',

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

  // exporting Muscle object to window

  window.Muscle = Muscle;
}());
