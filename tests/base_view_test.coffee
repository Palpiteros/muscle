describe 'Base View', ->
  before ->
    TestView = Muscle.View.extend
      className: 'test-view'
      tagName: 'article'
      id: 'test'
      templateDir: 'templates/'
      templateName: 'base_view_test'

    @testView = new TestView
    @testView.render()

  it 'should exist', ->
    expect(@testView).to.be.ok

  it 'should have a valid jquery instance in $el', ->
    expect(@testView.$el).to.exist

  it 'should have the same class, id and tag in both $el and view properties', ->
    expect(@testView.$el.is 'article').to.be.true
    expect(@testView.$el).to.have.class 'test-view'
    expect(@testView.$el).to.have.id 'test'
