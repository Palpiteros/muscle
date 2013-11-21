describe 'Collection View', ->
  before ->
    obj = [
      {
        name: 'name 1'
        descrition: 'desc 1'
      },
      {
        name: 'name 2'
        description: '2'
      }
    ]

    TestCollection = Backbone.Collection.extend
      model: Backbone.Model.extend {}

    TestModelView = Muscle.ModelView.extend
      className: 'model-test'
      tagName: 'li'
      templateDir: 'template/'
      templateName: 'model_view_test'

    TestCollectionView = Muscle.CollectionView.extend
      modelView: TestModelView
      className: 'collection-test'
      tagName: 'ul'

    @testCollectionView = new TestCollectionView
      collection: new TestCollection

    @testCollectionView.collection.reset obj

  it 'should exist', ->
    expect(@testCollectionView).to.be.ok

  it 'should have a collection', ->
    expect(@testCollectionView.collection).to.be.ok

  it 'should have 2 models', ->
    expect(@testCollectionView.collection.length).to.be 2

  it 'should be rendered', ->
    expect(@testCollectionView.$el.html).to.not.be.empty

