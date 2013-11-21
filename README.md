# Muscle.js

A layer on top of Backbonejs to bring more control to views and a better integration between views and models/collections.

#### using:
```
// create the model and collection

var Book = Backbone.Model.extend({});
var Books = Backbone.Collection.extend({ model: Book });

// create a model view

var BookShow = Muscle.ModelView.extend({
  className: 'book-show',
  tagName: 'article',
  templateName: 'book_show'
});

var bookShow = new BookShow({
  model: new Book({
    name: 'Backbonejs is easy',
    author: 'unknown'
  })
});

// create a collection view

var BookItem = Muscle.ModelView.extend({
  className: 'book-item',
  tagName: 'li',
  templateName: 'book_item'
});

var BookList = Muscle.CollectionView.extend({
  tagName: 'ul',
  className: 'book-list',
  modelView: BookItem
});

var bookList = new BookList({ collection: new Books });
```

#### compiling:
```
$ cake compile
```

The compile will output the files on tmp/ directory.

#### building:
```
$ cake build
```

The build will output a single file: tmp/muscle.js.

#### testing:
```
$ cake test
```

The test will build the lib and run the tests.
