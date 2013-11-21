describe 'Model View', ->
  before ->
    @modelName = 'Model Test'
    @modelDescription = 'This is a test model'

    TestModel = Backbone.Model.extend {}

    TestModelView = Muscle.ModelView.extend
      className: 'model-test'
      tagName: 'article'
      templateDir: 'template/'
      templateName: 'model_view_test'

    @testModelView = new TestModelView
      model: new TestModel
        name: @modelName
        description: @modelDescription

    @testModelView.render()

  it 'should exist', ->
    expect(@testModelView).to.be.ok

  it 'should have a model', ->
    expect(@testModelView.model).to.be.ok

  it 'should be rendered', ->
    expect(@testModelView.$el.find('.name').html).to.be @modelName
    expect(@testModelView.$el.find('.description').html).to.be @modelDescription

  it 'should change when model attributes change', ->
    newName = 'new name'
    newDescription = 'new description'

    @testModelView.model.set
      name: newName
      description: newDescription

    expect(@testModelView.$el.find('.name').html).to.be newName
    expect(@testModelView.$el.find('.description').html).to.be newDescription

  it 'should remove the view when the model is destroyed', ->
    div = document.createElement 'div'
    $(div).append @testModelView.$el
    @testModelView.model.destroy()
    expect(@testModelView.$el[0] in div.childNodes).to.be.false
