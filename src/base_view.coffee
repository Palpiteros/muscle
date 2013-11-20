(function() {
  'use strict';

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
}());
