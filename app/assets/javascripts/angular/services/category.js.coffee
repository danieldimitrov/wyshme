App.factory 'Category', ['$resource', ($resource) ->
  # TODO: Place root API's URL to configuration
  $resource 'http://wyshme-api.herokuapp.com/api/categories/:id', id: '@id'
]
